# s3/main.tf
#resource "aws_s3_bucket" "example" {
#  bucket = var.bucket_name
#  acl    = "private"
#}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "example" {
  bucket = "${var.bucket_name}-${random_id.bucket_suffix.hex}"
   #acl    = "private"
}

#resource "aws_s3_bucket_acl" "example_acl" {
#  bucket = aws_s3_bucket.example.id
#  acl    = "private"
#}
