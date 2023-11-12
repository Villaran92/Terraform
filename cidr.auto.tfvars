virginia_cidr = "10.10.0.0/16"
# public_subnet  = "10.10.0.0/24"
# private_subnet = "10.10.1.0/24"

# virginia_cidr = {
#   "prod" = "10.10.0.0/16"
#   "dev"  = "172.16.0.0/16"
# }

subnets = ["10.10.1.0/24", "10.10.2.0/24"]

etiquetas = {
  "env"     = "dev"
  "owner"   = "villaran"
  "cloud"   = "aws"
  "IAC"     = "Terraform"
  "Project" = "cerberus"
  "Region"  = "Virginia"
}

nombre = "VPC"

ec2name = {
  "Name" = "ec2-test"
}

nombre_gw = {
  "Name" = "gateway"
}

sg-allow-ip = "0.0.0.0/0"

ec2_specs = {
  "ami"           = "ami-0e8a34246278c21e4"
  "instance_type" = "t2.micro"
}

enable_monitoring = false

ingress_port_list = [22, 80, 443]
