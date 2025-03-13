# variables.tf
variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "example-cluster"
}

variable "subnet_ids" {
  description = "The VPC subnets to launch the cluster in"
  type        = list(string)
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t2.micro"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "node_group_name" {
  description = "The name of the Node Group for EKS Cluster"
  type        = string
}

variable "ec2_ssh_key" {
  description = "The SSH key to use for EC2 instances in the node group"
  type        = string
}