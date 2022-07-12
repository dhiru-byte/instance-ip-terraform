
module "vpc" {
  source                       = "terraform-aws-modules/vpc/aws"
  name                         = "${var.name}-vpc"
  cidr                         = var.cidr_block
  azs                          = var.availability_zones
  private_subnets              = var.private_subnets_cidr
  public_subnets               = var.public_subnets_cidr
  create_database_subnet_group = true
  enable_nat_gateway           = true
  single_nat_gateway           = true
}

