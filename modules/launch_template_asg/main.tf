
resource "aws_launch_template" "this" {
  name = var.launch_template_name
  # name_prefix = var.launch_template_use_name_prefix 
  description                          = var.launch_template_description
  ebs_optimized                        = var.ebs_optimized
  image_id                             = var.image_id
  key_name                             = var.key_name
  user_data                            = var.user_data
  instance_type                        = var.instance_type
  default_version                      = var.default_version
  update_default_version               = var.update_default_version
  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  kernel_id                            = var.kernel_id
  ram_disk_id                          = var.ram_disk_id
  tags                                 = merge(var.tags)
}

################################################################################
# Autoscaling group - default
################################################################################

resource "aws_autoscaling_group" "this" {
  name = var.name
  launch_template {
    id      = aws_launch_template.this.id
    version = var.launch_template_version
  }
  availability_zones        = var.availability_zones
  vpc_zone_identifier       = var.vpc_zone_identifier
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  capacity_rebalance        = var.capacity_rebalance
  min_elb_capacity          = var.min_elb_capacity
  wait_for_elb_capacity     = var.wait_for_elb_capacity
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  default_cooldown          = var.default_cooldown
  protect_from_scale_in     = var.protect_from_scale_in
  load_balancers            = var.load_balancers
  target_group_arns         = var.target_group_arns
  placement_group           = var.placement_group
  health_check_type         = var.health_check_type
  health_check_grace_period = var.health_check_grace_period
  force_delete              = var.force_delete
  termination_policies      = var.termination_policies
  suspended_processes       = var.suspended_processes
  max_instance_lifetime     = var.max_instance_lifetime
  enabled_metrics           = var.enabled_metrics
  metrics_granularity       = var.metrics_granularity
  service_linked_role_arn   = var.service_linked_role_arn
}
