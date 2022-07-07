variable "tags" {
  type = map(any)
  default = {
    Environment = "Dev"
    Owner       = "Dhiru"
  }
}

variable "name" {
  description = "EC2"
  type        = string
  default     = "test-dhiru-instance"
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-052efd3df9dad4825"
}

variable "image_id" {
  description = "The AMI from which to launch the instance"
  type        = string
  default     = "ami-052efd3df9dad4825"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = "dhirendra-aws"
}

variable "desired_capacity" {
  description = "Desire Capacity for Instance"
  type        = number
  default     = 1

}
variable "max_size" {
  description = "Max_size for Instance"
  type        = number
  default     = 1
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

variable "launch_template_version" {
  description = "Launch template version. Can be version number, `$Latest`, or `$Default`"
  type        = string
  default     = "1.0"
}

variable "launch_template_name" {
  description = "Name of launch template to be created"
  type        = string
  default     = "test_asg_lt"
}

variable "availability_zones" {
  description = "A list of one or more availability zones for the group. Used for EC2-Classic and default subnets when not specified with `vpc_zone_identifier` argument. Conflicts with `vpc_zone_identifier`"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in. Subnets automatically determine which availability zones the group will reside. Conflicts with `availability_zones`"
  type        = list(string)
  default     = null
}

######### ALB target group variables.

variable "target_group_name" {
  type    = string
  default = "testapplALB"

}

variable "vpc_id" {
  type    = string
  default = "vpc-04ea9dde604be2190"

}

variable "alb_name" {
  type    = string
  default = "dhiru-test-app-alb"

}

variable "load_balancer_type" {
  description = "The type of load balancer to create. Possible values are application or network."
  type        = string
  default     = "application"
}

variable "subnets" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = list(string)
  default     = ["subnet-09a399bf4457d04dd", "subnet-01fa36b0a52c2e17c", "subnet-0b91aeb51d960e992" ]
}
