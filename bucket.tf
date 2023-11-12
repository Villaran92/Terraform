resource "aws_s3_bucket" "s3" {
  bucket = "s3-${local.s3-sufix}"
}
