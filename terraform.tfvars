aws_region = "eu-west-1"

# Network
vpc_name = "cmtr-dft5l1nz-vpc"
vpc_cidr = "10.10.0.0/16"

subnet1_name       = "cmtr-dft5l1nz-subnet-public-a"
subnet1_cidr       = "10.10.1.0/24"
availability_zone1 = "eu_west-1a"

subnet2_name       = "cmtr-dft5l1nz-subnet-public-b"
subnet2_cidr       = "10.10.3.0/24"
availability_zone2 = "eu-west-1b"

subnet3_name       = "cmtr-dft5l1nz-subnet-public-c"
subnet3_cidr       = "10.10.5.0/24"
availability_zone3 = "eu-west-1c"

internet_gateway = "cmtr-dft5l1nz-igw"
routing_table    = "cmtr-dft5l1nz-rt"

# Network security
allowed_ip_range = ["18.153.146.156/32", "190.159.90.18/32"]

ssh_security_group_name          = "cmtr-dft5l1nz-ssh-sg"
public_http_security_group_name  = "cmtr-dft5l1nz-public-http-sg"
private_http_security_group_name = "cmtr-dft5l1nz-private-http-sg"

# Application
aws_launch_template_name = "cmtr-dft5l1nz-template"
aws_asg_name             = "cmtr-dft5l1nz-asg"
load_balancer            = "cmtr-dft5l1nz-lb"
target_group_name        = "cmtr-dft5l1nz-tg"

instance_type        = "t3.micro"
asg_desired_capacity = 2
asg_min_size         = 2
asg_max_size         = 2
