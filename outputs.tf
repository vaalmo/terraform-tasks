output "instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.this.id
}

output "instance_public_ip" {
  description = "Public IP address used to SSH into the instance."
  value       = aws_instance.this.public_ip
}

output "key_pair_name" {
  description = "Name of the key pair registered in AWS."
  value       = aws_key_pair.this.key_name
}

output "ssh_command" {
  description = "Command to connect to the instance with the local private key."
  value       = "ssh -i ~/.ssh/epam_lab ec2-user@${aws_instance.this.public_ip}"
}
