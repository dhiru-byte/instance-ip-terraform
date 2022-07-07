locals {
  region = "us-east-1"
}


# module "default" {
#   source               = "./modules/launch_template_asg"
#   name                 = var.name
#   availability_zones   = var.availability_zones
#   min_size             = var.min_size
#   max_size             = var.max_size
#   desired_capacity     = var.desired_capacity
#   instance_type        = var.instance_type
#   image_id             = var.image_id
#   launch_template_name = var.launch_template_name
#   tags                 = merge(var.tags)
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
