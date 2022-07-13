
output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc

}

# output "subnet_id" {
#     value = module.networking.vpc.subnet_id

# }

output "security_group_id" {
  value = module.web_server_sg

}
output "lb_id" {
  description = "The ID and ARN of the load balancer we created."
  value       = module.alb.lb_id
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = module.alb.lb_dns_name
}

output "lb_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records."
  value       = module.alb.lb_zone_id
}

output "target_group_arns" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
  value       = module.alb.target_group_arns
}

output "target_group_names" {
  description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group."
  value       = module.alb.target_group_names
}

output "route53_zone_name" {
  description = "Route53 Zone Name"  
  value = module.route53_zone.zone_name

}

output "route53_record" {
  description = "Route53 Record Name"  
  value = module.route53_record.route53_record

}
