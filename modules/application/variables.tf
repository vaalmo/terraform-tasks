variable "vpc_id" {
  description = "ID of the VPC (used by the target group)."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the load balancer and the Auto Scaling group."
  type        = list(string)
}

variable "instance_security_group_ids" {
  description = "Security group IDs attached to the EC2 instances."
  type        = list(string)
}

variable "lb_security_group_id" {
  description = "Security group ID attached to the load balancer."
  type        = string
}

variable "aws_launch_template_name" {
  description = "Name of the launch template."
  type        = string
}

variable "aws_asg_name" {
  description = "Name of the Auto Scaling group."
  type        = string
}

variable "load_balancer" {
  description = "Name of the Application Load Balancer."
  type        = string
}

variable "target_group_name" {
  description = "Name of the ALB target group."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "asg_desired_capacity" {
  description = "Desired number of instances."
  type        = number
}

variable "asg_min_size" {
  description = "Minimum number of instances."
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances."
  type        = number
}
