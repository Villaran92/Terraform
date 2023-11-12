variable "virginia_cidr" {
  description = "CIDR Virginia"
  type        = string
}

# variable "public_subnet" {
#   description = "CIDR Public subnet"
#   type        = string
# }

# variable "private_subnet" {
#   description = "CIDR Private subnet"
#   type        = string
# }

variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}

variable "etiquetas" {
  description = "tags del proyecto"
  type        = map(string)
}

variable "nombre" {
}

variable "ec2name" {
  type = map(string)
}

variable "nombre_gw" {
  type = map(string)
}

variable "sg-allow-ip" {
  description = "Ingress traffic"
  type        = string
}

variable "ec2_specs" {
  description = "ec2 specs"
  type        = map(string)
}

variable "enable_monitoring" {
  description = "Habilita monitorizacion server"
  type        = bool
}

variable "ingress_port_list" {
  description = "puertos ingress"
  type        = list(number)
}
