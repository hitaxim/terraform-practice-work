# main.tf
provider "aws" {
  region = var.aws_region
}

provider "random" {}

provider "kubernetes" {
  host                   = aws_eks_cluster.example.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.example.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.example.token
}

module "eks" {
  source          = "./eks"
  cluster_name    = var.cluster_name
  subnet_ids      = var.subnet_ids
  node_group_name = var.node_group_name
  ec2_ssh_key     = var.ec2_ssh_key
}

module "s3" {
  source      = "./s3"
  bucket_name = var.bucket_name
}

module "instances" {
  source        = "./instances"
  ami_id        = var.ami_id
  instance_type = var.instance_type  
}

#output "instance_public_ip" {
#  value = aws_instance.airbyte.public_ip
#}


# Define EC2 instance in the root module
resource "aws_instance" "airbyte" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.ec2_ssh_key
  subnet_id     = var.subnet_ids[0]

  tags = {
    Name = "Airbyte-Instance"
  }
# User data script to install Docker and Airbyte
  user_data = <<-EOF
              #!/bin/bash
              # Update package list
              sudo apt-get update -y
              # Install Docker
              sudo apt-get install docker.io -y
              # Start Docker service
              sudo systemctl start docker
              sudo systemctl enable docker
              # Install Docker Compose
              sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              sudo chmod +x /usr/local/bin/docker-compose
              # Create a directory for Airbyte
              mkdir /home/ubuntu/airbyte
              cd /home/ubuntu/airbyte
              # Create a Docker Compose file
              echo "version: '3.5'
              services:
                airbyte:
                  image: airbyte/airbyte:latest
                  ports:
                    - '8000:8000'
              " > docker-compose.yml
              # Run Airbyte
              sudo docker-compose up -d
              EOF

}