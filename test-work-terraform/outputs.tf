# outputs.tf
output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "instance_ids" {
  value = module.instances.instance_ids
}

output "node_group_name" {
  value = module.eks.node_group_name
}

output "instance_public_ip" {
  value = aws_instance.airbyte.public_ip
}

#output "eks_cluster_endpoint" {
#  value = aws_eks_cluster.example.endpoint
#}

#output "eks_cluster_certificate_authority_data" {
#  value = aws_eks_cluster.example.certificate_authority.0.data
#}