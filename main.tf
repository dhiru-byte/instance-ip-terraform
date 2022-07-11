module "networking" {
  source = "./modules/vpc" #"terraform-aws-modules/vpc/aws"
  #   version         = "=3.14.2"
  name = var.name
  #   cidr            = var.cidr_block
  #   azs             = var.availability_zones
  #   private_subnets = var.private_subnets_cidr
  #   public_subnets  = var.public_subnets_cidr
  #   enable_nat_gateway = true
}

module "ssh-key" {
  source = "./modules/ssh-key"
  name   = var.name
}


module "asg" {
  source               = "terraform-aws-modules/autoscaling/aws" #"./modules/launch_template_asg"
  version              = "=6.5.1"
  name                 = var.name
  vpc_zone_identifier  = var.vpc_zone_identifier
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  instance_type        = var.instance_type
  key_name             = var.key_name
  image_id             = var.image_id
  launch_template_name = var.launch_template_name
  #   security_groups       = "var.security_groups"
  tags = merge(var.tags)
}


# module "web_server_sg" {
#   source              = "terraform-aws-modules/security-group/aws//modules/http-80" #"terraform-aws-modules/security-group/aws"
# #   version             = "4.9.0"
#   name                = "web-server"
#   description         = "Security group for web-server with HTTP ports open within VPC"
#   vpc_id              = module.networking.vpc_id
#   ingress_cidr_blocks = [var.cidr_block]

#     ingress_with_cidr_blocks = [
#     {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       description = "SSH"
#       cidr_blocks = "0.0.0.0/0"
#     },
#   ]

# }

# module "main_sg" {
#   source              = "./modules/security_groups"
#   name                = "${var.name}-sg"
#   description         = "Security group which is used as an argument in complete-sg"
#   vpc_id              = var.vpc_id
#   ingress_cidr_blocks = ["10.10.0.0/16"]
#   ingress_rules       = ["https-443-tcp"]
# }

# module "alb" {
#   source             = "./modules/alb_target_group"
#   name               = var.alb_name
#   load_balancer_type = var.load_balancer_type
#   subnets            = var.subnets
#   vpc_id             = var.vpc_id
# }

# module "ec2" {
#   source     = "./modules/ec2"
#   name       = var.name
#   vpc        = module.networking.vpc
#   sg_pub_id  = module.networking.sg_pub_id
#   sg_priv_id = module.networking.sg_priv_id
#   key_name   = module.ssh-key.key_name
# }
