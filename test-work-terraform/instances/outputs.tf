# instances/outputs.tf
output "instance_ids" {
  value = aws_instance.example.id
}
