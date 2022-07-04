locals {
  region = "us-east-1"
}

##############
# VPC Module
##############

module "vpc" {
  source             = "./module/vpc"
  name               = var.name
  cidr               = var.cidr
  azs                = var.azs
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  enable_ipv6        = false
  enable_nat_gateway = false
  single_nat_gateway = true
  tags               = merge(var.tags)
}
