# terraform.tfvars
aws_region      = "us-east-2"
cluster_name    = "terraform-cluster"
subnet_ids      = ["subnet-0d188ff60ee13dd38", "subnet-023e63482d03ce32c"]
ami_id          = "ami-07d7e3e669718ab45"
bucket_name     = "terraform-test-s3-bucket"
node_group_name = "test-node-eks"
ec2_ssh_key     = "my-ec2-key" # key_test_airbyte # add your own key