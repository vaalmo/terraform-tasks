output "instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.this.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance."
  value       = aws_instance.this.public_ip
}

output "discovered_vpc_id" {
  description = "ID of the VPC found by the aws_vpc data source."
  value       = data.aws_vpc.this.id
}

output "discovered_ami_id" {
  description = "ID of the Amazon Linux 2023 AMI found by the aws_ami data source."
  value       = data.aws_ami.amazon_linux.id
}
