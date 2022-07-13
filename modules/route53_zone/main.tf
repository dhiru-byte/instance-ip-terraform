resource "aws_route53_zone" "this" {
  name = "tftestapp.com" #var.domain_name
  tags = merge(var.tags)
}
