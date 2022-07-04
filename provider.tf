provider "aws" {
  region = "us-east-1"
}

terraform {
  #   backend "s3" {
  #   bucket = "grahan-tf-test-bucket"
  #   key    = "terraform/tfstate/"
  #   region = "us-east-1"
  # }
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.20"
    }
  }
}