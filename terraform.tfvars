region        = "eu-west-1"
prefix        = "cmtr-dft5l1nz-01"
vpc_cidr      = "10.10.0.0/16"
internet_cidr = "0.0.0.0/0"

public_subnets = {
  a = {
    availability_zone = "eu-west-1a"
    cidr_block        = "10.10.1.0/24"
  }
  b = {
    availability_zone = "eu-west-1b"
    cidr_block        = "10.10.3.0/24"
  }
  c = {
    availability_zone = "eu-west-1c"
    cidr_block        = "10.10.5.0/24"
  }
}
