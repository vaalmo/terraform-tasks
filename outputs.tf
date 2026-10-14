output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer; open it in a browser."
  value       = aws_lb.this.dns_name
}

output "launch_template_id" {
  description = "ID of the Launch Template."
  value       = aws_launch_template.this.id
}

output "asg_name" {
  description = "Name of the Auto Scaling Group."
  value       = aws_autoscaling_group.this.name
}

output "target_group_arn" {
  description = "ARN of the ALB target group."
  value       = aws_lb_target_group.this.arn
}
