# eks/outputs.tf
output "cluster_name" {
  value = aws_eks_cluster.example.name
}

output "node_group_name" {
   value = aws_eks_node_group.example.node_group_name
}

#output "eks_cluster_endpoint" {
#  value = aws_eks_cluster.example.endpoint
#}

#output "eks_cluster_certificate_authority_data" {
#  value = aws_eks_cluster.example.certificate_authority.0.data
#}