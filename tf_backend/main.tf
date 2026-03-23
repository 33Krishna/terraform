terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.36.0"
    }
  }
  backend "s3" {
    bucket = "my-s3-bucket-79f0eaf9f65fa452"
    key    = "backend.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "myserver" {
  ami           = "ami-0c0e147c706360bd7"
  instance_type = "t3.nano"

  tags = {
    Name = "SampleServer"
  }
}

