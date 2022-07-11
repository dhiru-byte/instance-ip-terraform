variable "name" {
  type = string
}


variable "cidr_block" {
  type        = string
  description = "CIDR range"
  default     = "10.0.0.0/16"

}

variable "public_subnets_cidr" {
  type    = list(any)
  default = ["10.0.0.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidr" {
  type    = list(any)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  type        = list(any)
  description = "List of Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}