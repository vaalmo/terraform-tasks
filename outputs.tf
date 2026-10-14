output "instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.this.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance."
  value       = aws_instance.this.public_ip
}

output "vpc_id" {
  description = "VPC ID read from the Landing Zone remote state."
  value       = data.terraform_remote_state.base_infra.outputs.vpc_id
}
