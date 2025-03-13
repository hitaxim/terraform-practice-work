# eks/variables.tf
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "example-cluster"
}

variable "subnet_ids" {
  description = "The VPC subnets to launch the cluster in"
  type        = list(string)
}

variable "node_group_name" {
  description = "The name of the Node Group for EKS Cluster"
  type        = string
}

variable "ec2_ssh_key" {
  description = "The SSH key to use for EC2 instances in the node group"
  type        = string
}
