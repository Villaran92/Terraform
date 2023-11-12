###           COUNT           ###


# variable "instancias" {
#   description = "nombre de las instancias"
#   type        = list(string)
#   default     = ["apache", "mysql", "jumpserver"]

# }

# resource "aws_instance" "ec2_public" {
#   count                  = length(var.instancias)
#   ami                    = var.ec2_specs.ami
#   instance_type          = var.ec2_specs.instance_type
#   subnet_id              = aws_subnet.public_subnet.id
#   key_name               = data.aws_key_pair.key.key_name
#   vpc_security_group_ids = [aws_security_group.public_security_group.id]
#   user_data              = file("scripts/userdata.sh")

#   tags = {
#     "Name" = var.instancias[count.index]
#   }
# }


###       FOR EACH      ###

variable "instancias" {
  description = "nombre de las instancias"
  type        = set(string)
  # type        = list(string)
  default = ["apache"]

}

resource "aws_instance" "ec2_public" {
  for_each = var.instancias
  #  for_each               = toset[var.instancias] 
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.public_security_group.id]
  # user_data              = file("scripts/userdata.sh")

  tags = {
    "Name" = "${each.value}-${local.sufix}"
  }
}

resource "aws_instance" "ec2_public_monitor" {
  count                  = var.enable_monitoring ? 1 : 0
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.public_security_group.id]
  # user_data              = file("scripts/userdata.sh")

  tags = {
    "Name" = "Monitor-${local.sufix}"
  }
}
