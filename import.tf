# resource "aws_instance" "web" {
#   ami           = "ami-05c13eab67c5d8861"
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.public_subnet.id
#   tags = {
#     "Name" = "myserver"
#   }
#   tags_all = {
#     "Name" = "myserver"
#   }
#   vpc_security_group_ids = [
#     aws_security_group.public_security_group.id
#   ]

# }
