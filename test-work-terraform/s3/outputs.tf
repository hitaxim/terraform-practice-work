# s3/outputs.tf
output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}
