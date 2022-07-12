variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}
variable "zones" {
  description = "Map of Route53 zone parameters"
  type        = any
  default     = {}
}

variable "zone_id" {
  description = "ID of DNS zone"
  type        = string
  default     = null
}

variable "records" {
  description = "List of objects of DNS records"
  type        = any
  default     = []
}