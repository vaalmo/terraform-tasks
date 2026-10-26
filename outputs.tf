output "load_balancer_dns_name" {
  description = "DNS name of the Application Load Balancer; open it with http:// in a browser."
  value       = module.application.load_balancer_dns_name
}

output "vpc_id" {
  description = "ID of the VPC created by the network module."
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets created by the network module."
  value       = module.network.public_subnet_ids
}

output "security_group_ids" {
  description = "IDs of the security groups created by the network_security module."
  value = {
    ssh          = module.network_security.ssh_security_group_id
    public_http  = module.network_security.public_http_security_group_id
    private_http = module.network_security.private_http_security_group_id
  }
}
