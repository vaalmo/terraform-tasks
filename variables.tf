variable "ssh_key" {
  description = "Provides custom public SSH key."
  type        = string
}

variable "aws_region" {
  description = "AWS region where all resources are created."
  type        = string
}

variable "project_id" {
  description = "Lab ID used as the prefix for every resource name (e.g. cmtr-xxxx)."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the SSH-accessible instance."
  type        = string
}

variable "tags" {
  description = "Tags applied to every resource created by this configuration."
  type        = map(string)
}
