aws_region = "eu-west-1"
project_id = "cmtr-dft5l1nz"

# Pre-created environment
vpc                  = "cmtr-dft5l1nz-vpc"
public_subnet_a_cidr = "10.0.1.0/24"
public_subnet_b_cidr = "10.0.3.0/24"
ssh_inbound_id       = "cmtr-dft5l1nz-ec2_sg"
http_inbound_id      = "cmtr-dft5l1nz-http_sg"
lb_http_inbound_id   = "cmtr-dft5l1nz-sglb"
iam_instance_profile = "cmtr-dft5l1nz-instance_profile"
key_name             = "cmtr-dft5l1nz-keypair"

# Resources created in this task
aws_launch_template_name = "cmtr-dft5l1nz-template"
aws_asg_name             = "cmtr-dft5l1nz-asg"
load_balancer            = "cmtr-dft5l1nz-loadbalancer"
target_group_name        = "cmtr-dft5l1nz-targetgroup"

instance_type        = "t3.micro"
asg_desired_capacity = 2
asg_min_size         = 1
asg_max_size         = 2
