data "aws_vpc" "default" {
  default = false
}

data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

locals {
  # name   = "ex-asg-complete"
  user_data = <<-EOT
  sudo apt-get update -y 
  sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
  sudo apt-get update -y
  sudo apt-get install -y docker-ce
  sudo useradd docker
  sudo usermod -aG docker ubuntu
  sudo su docker
  echo "Hello Terraform!"
  EOT
}
## Module to create VPC, 2 Public & 2 Private Subnets using CIDR ranges Passed in Child Module in Module Directory.
module "networking" {
  source = "./modules/vpc"
  name   = var.name
  #source = "terraform-aws-modules/vpc/aws"
  # version = "=3.14.2"

}

## Module To Create a Key to use for SSH with VMS.
module "ssh-key" {
  source = "./modules/ssh-key"
  name   = var.name
}

#### Module to create A Security Group to attach to EC2 to allow SSH access.

module "web_server_sg" {
  #source = "terraform-aws-modules/security-group/aws//modules/http-80"
  # version     = "4.9.0"
  source = "./modules/security_groups"
  name        = "web-server"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = data.aws_vpc.default.id

}

### Module to create a Launch Template to use with Autoscaling Group.

module "asg" {
  # source = "./modules/launch_template_asg" 
  source               = "terraform-aws-modules/autoscaling/aws"
  version              = "=6.5.1"
  name                 = var.name
  vpc_zone_identifier  = var.vpc_zone_identifier
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  instance_type        = var.instance_type
  key_name             = var.key_name
  image_id             = var.image_id
  user_data            = base64encode(local.user_data)
  launch_template_name = var.launch_template_name
  security_groups      = var.security_groups
  tags                 = merge(var.tags)
}


##### Module to create a Application Loadbalancer

module "alb" {
  # source             = "./modules/alb"
  source          = "terraform-aws-modules/alb/aws"
  version         = "~> 6.0"
  name            = var.alb_name
  vpc_id          = var.vpc_id
  subnets         = var.vpc_zone_identifier
  security_groups = var.security_groups

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      # targets = {
      #   my_target = {
      #     target_id = var.target_id
      #     port      = 80
      #   }
      # }
    }
  ]

  # https_listeners = [
  #   {
  #     port               = 443
  #     protocol           = "HTTPS"
  #     certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
  #     target_group_index = 0
  #   }
  # ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
}


#### Module to Create Route53 Zone

module "route53_zone" {
  source = "./modules/route53_zone"

}

#### Module to create route53 Record

module "route53_record" {
  source          = "./modules/route53_record"
  records         = var.records
  target_zone_id  = var.target_zone_id
  target_dns_name = var.target_dns_name

  depends_on = [
    module.route53_zone
  ]
}

# module "ec2" {
#   source     = "./modules/ec2"
#   name       = var.name
#   vpc        = module.networking.vpc
#   sg_pub_id  = module.networking.sg_pub_id
#   sg_priv_id = module.networking.sg_priv_id
#   key_name   = module.ssh-key.key_name
# }
