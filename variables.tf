variable "aws_region" {
  description = "AWS region where all resources are created."
  type        = string
}

variable "project_id" {
  description = "Project ID used for the Project tag."
  type        = string
}

# --- Pre-created environment (name or ID; lookups in data.tf handle both) ---

variable "vpc" {
  description = "Name tag or ID of the pre-created VPC."
  type        = string
}

variable "public_subnet1" {
  description = "Name tag or ID of the first pre-created public subnet."
  type        = string
}

variable "public_subnet2" {
  description = "Name tag or ID of the second pre-created public subnet."
  type        = string
}

variable "ssh_inbound" {
  description = "Name or ID of the security group that allows SSH to the instances."
  type        = string
}

variable "http_inbound" {
  description = "Name or ID of the security group that allows HTTP to the instances."
  type        = string
}

variable "lb_http_inbound" {
  description = "Name or ID of the security group that allows HTTP to the load balancer."
  type        = string
}

# --- Resources created in this task ---

variable "load_balancer" {
  description = "Name of the Application Load Balancer."
  type        = string
}

variable "blue_target_group_name" {
  description = "Name of the Blue target group."
  type        = string
}

variable "green_target_group_name" {
  description = "Name of the Green target group."
  type        = string
}

variable "blue_launch_template_name" {
  description = "Name of the Blue launch template."
  type        = string
}

variable "green_launch_template_name" {
  description = "Name of the Green launch template."
  type        = string
}

variable "blue_asg_name" {
  description = "Name of the Blue Auto Scaling group."
  type        = string
}

variable "green_asg_name" {
  description = "Name of the Green Auto Scaling group."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for both environments."
  type        = string
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in each Auto Scaling group."
  type        = number
}

variable "asg_min_size" {
  description = "Minimum number of instances in each Auto Scaling group."
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances in each Auto Scaling group."
  type        = number
}

# --- Traffic weights ---

variable "blue_weight" {
  description = "Percentage of ALB traffic routed to the Blue target group."
  type        = number
}

variable "green_weight" {
  description = "Percentage of ALB traffic routed to the Green target group."
  type        = number
}
