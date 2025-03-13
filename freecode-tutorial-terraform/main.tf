provider "aws" {
    region = "us-east-2"
    # mention the access-key and secret key to hard-code

}

resource "aws_instance" "my-first-server" {
    ami =  "ami-07d7e3e669718ab45"
    instance_type = "t2.micro"
  
  tags = {
    Name = "First-Ec2-ubuntu"
  }
}

output "server_public_ip" {
  value = aws_instance.my-first-server.public_ip
  
}

resource "aws_vpc" "first-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "Production"
    }
}

resource "aws_subnet" "subnet-1" {
    vpc_id = aws_vpc.first-vpc.id
    cidr_block = "10.0.0.1/24"

    tags = {
      Name = "prod-subnet"
    }
}