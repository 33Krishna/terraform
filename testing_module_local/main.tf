provider "aws" {
  region = "us-east-1"
}

module "krishna-aws-vpc" {
    source  = "33Krishna/krishna-aws-vpc/vpc"
    version = "1.0.0"
    # insert the 2 required variables here
#   vpc_config = {
#     cidr_block = "10.0.0.0/16"
#     name       = "your_vpc_name"
#   }
#   subnet_config = {
#     public_subnet = {
#       cidr_block = "10.0.0.0/24"
#       az         = "us-east-1a"
#       #To set the subnet as public, default is private
#       public = true
#     }

#     private_subnet = {
#       cidr_block = "10.0.1.0/24"
#       az         = "us-east-1b"
#     }
#   }
}