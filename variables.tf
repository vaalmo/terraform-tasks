variable "aws_region" {
  description = "AWS region for the resources and the remote state bucket."
  type        = string
}

variable "project_id" {
  description = "Project identifier used for tagging."
  type        = string
}

variable "state_bucket" {
  description = "S3 bucket name that stores the Landing Zone remote state."
  type        = string
}

variable "state_key" {
  description = "S3 key path to the Landing Zone remote state file."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the instance."
  type        = string
}
