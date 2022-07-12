data "aws_route53_zone" "this" {
  zone_id = var.zone_id
  name    = "tftestapp.com"
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "dev"
  type    = "A"

  alias {
    name                   = var.target_dns_name
    zone_id                = var.target_zone_id
    evaluate_target_health = true
  }
}