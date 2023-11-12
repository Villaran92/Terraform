output "ec2_public_ip" {
  description = "ip publica ec2"
  #  value       = aws_instance.ec2_public.public_ip
  value = var.instancias
}

output "s3_name" {
  value = aws_s3_bucket.s3.id
}
