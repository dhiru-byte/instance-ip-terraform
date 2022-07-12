
variable "zone_id" {
  description = "ID of DNS zone"
  type        = string
  default     = null
}

variable "zone_name" {
  description = "Name of DNS zone"
  type        = string
  default     = null
}

variable "private_zone" {
  description = "Whether Route53 zone is private or public"
  type        = bool
  default     = false
}

variable "records" {
  description = "List of objects of DNS records"
  type        = any
  default     = []
}

variable "target_dns_name" {
  type        = string
  description = "DNS name of target resource (e.g. ALB, ELB)"
}

variable "target_zone_id" {
  type        = string
  description = "ID of target resource (e.g. ALB, ELB)"
}

# variable "aws_lb_hosted_zone_id" {
#     type = string
#     default = "Z35SXDOTRQ7X7K"

# }
