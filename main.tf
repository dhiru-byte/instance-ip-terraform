locals {
  region = "us-east-1"
}

module "default" {
  source               = "./modules/launch_template_asg"
  name                 = var.name
  availability_zones   = var.availability_zones
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  instance_type        = var.instance_type
  image_id             = var.image_id
  launch_template_name = var.launch_template_name
  tags                 = merge(var.tags)
}
