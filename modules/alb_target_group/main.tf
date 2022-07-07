
resource "aws_lb" "this" {
  name                             = var.name
  name_prefix                      = var.name_prefix
  load_balancer_type               = var.load_balancer_type
  internal                         = var.internal
  security_groups                  = var.security_groups
  subnets                          = var.subnets
  idle_timeout                     = var.idle_timeout
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_deletion_protection       = var.enable_deletion_protection
  enable_http2                     = var.enable_http2
  ip_address_type                  = var.ip_address_type
  drop_invalid_header_fields       = var.drop_invalid_header_fields

  tags = merge(
    var.tags,
    {
      Name = var.name != null ? var.name : var.name_prefix
    },
  )
}

resource "aws_lb_target_group" "main" {
  name       = var.name
  port       = var.port
  protocol   = var.protocol
  vpc_id     = var.vpc_id
  tags       = merge(var.tags, )
  depends_on = [aws_lb.this]

  lifecycle {
    create_before_destroy = true
  }
}

# locals {
#   # Merge the target group index into a product map of the targets so we
#   # can figure out what target group we should attach each target to.
#   # Target indexes can be dynamically defined, but need to match
#   # the function argument reference. This means any additional arguments
#   # can be added later and only need to be updated in the attachment resource below.
#   # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment#argument-reference
#   target_group_attachments = merge(flatten([
#     for index, group in var.target_groups : [
#       for k, targets in group : {
#         for target_key, target in targets : join(".", [index, target_key]) => merge({ tg_index = index }, target)
#       }
#       if k == "targets"
#     ]
#   ])...)
# }

# resource "aws_lb_target_group_attachment" "this" {
#   for_each = var.create_lb && local.target_group_attachments != null ? local.target_group_attachments : {}

#   target_group_arn  = aws_lb_target_group.main[each.value.tg_index].arn
#   target_id         = each.value.target_id
#   port              = lookup(each.value, "port", null)
#   availability_zone = lookup(each.value, "availability_zone", null)
# }

# resource "aws_lb_target_group" "test" {
#   name     = var.target_group_name
#   port     = var.port
#   protocol = var.protocol
#   vpc_id   = var.vpc_id
# }
