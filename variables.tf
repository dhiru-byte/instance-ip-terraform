variable "name" {
  type    = string
  default = "tf-dhiru-vpc"
}

variable "tags" {
  type = map(any)
  default = {
    Environment = "Dev"
    Owner       = "Dhiru"
  }
}

variable "instance_name" {
  description = "Name that is propogated to launched EC2 instances via a tag - if not provided, defaults to `var.name`"
  type        = string
  default     = ""
}

variable "desired_capacity" {
  description = "Desire Capacity for Instance"
  type        = number
  default     = 1

}
variable "max_size" {
  description = "Max_size for Instance"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Min_size for Instance"
  type        = number
  default     = 1
}

variable "launch_template" {
  description = "Name of an existing launch template to be used (created outside of this module)"
  type        = string
  default     = "asg-lt"
}

variable "launch_template_name" {
  description = "Name of launch template to be created"
  type        = string
  default     = "test_launch_template"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = "tf-dhiru-vpc-key"
}

# variable "user_data" {
#   description = "The Base64-encoded user data to provide when launching the instance"
#   type        = string
#   default     = null
# }

variable "image_id" {
  description = "The AMI from which to launch the instance"
  type        = string
  default     = "ami-052efd3df9dad4825"
}

variable "availability_zones" {
  type        = list(any)
  description = "List of Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "security_groups" {
  description = "A list of security group IDs to associate"
  type        = list(string)
  default     = ["sg-098e9eed4c990e8d3"]
}

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in."
  type        = list(string)
  default     = ["subnet-0c2aec6ccea255429", "subnet-01cf030e3418d1634"]
}

variable "cidr_block" {
  description = "CIDR range"
  default     = "10.0.0.0/16"

}

variable "alb_name" {
  description = "The resource name and Name tag of the load balancer."
  type        = string
  default     = "tf-test-lb-app"
}
