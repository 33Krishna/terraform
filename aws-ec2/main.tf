terraform {
    required_providers {
        aws = { 
            source = "hashicorp/aws" 
            version = "6.36.0" 
        } 
    }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "simple_ec2_instance" {
  ami           = "ami-02dfbd4ff395f2a1b"
  instance_type = "t3.micro"

  tags = {
    Name = "SimpleEC2Instance"
  }
}