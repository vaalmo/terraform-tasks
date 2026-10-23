aws_region = "eu-west-1"
project_id = "cmtr-dft5l1nz"

vpc             = "cmtr-dft5l1nz-vpc"
public_subnet1  = "cmtr-dft5l1nz-public-subnet1"
public_subnet2  = "cmtr-dft5l1nz-public-subnet2"
ssh_inbound     = "cmtr-dft5l1nz-sg-ssh"
http_inbound    = "cmtr-dft5l1nz-sg-http"
lb_http_inbound = "cmtr-dft5l1nz-sg-lb"

load_balancer              = "cmtr-dft5l1nz-lb"
blue_target_group_name     = "cmtr-dft5l1nz-blue-tg"
green_target_group_name    = "cmtr-dft5l1nz-green-tg"
blue_launch_template_name  = "cmtr-dft5l1nz-blue-template"
green_launch_template_name = "cmtr-dft5l1nz-green-template"
blue_asg_name              = "cmtr-dft5l1nz-blue-asg"
green_asg_name             = "cmtr-dft5l1nz-green-asg"

instance_type        = "t3.micro"
asg_desired_capacity = 1
asg_min_size         = 1
asg_max_size         = 2

blue_weight  = 100
green_weight = 0