terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.36.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
}

provider "aws" {
  region = var.region
}

#Random_ID
resource "random_id" "r_id" {
  byte_length = 8
}

#S3 Bucket
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-s3-bucket-${random_id.r_id.hex}"

  tags = {
    Name        = "my-s3-bucket-${random_id.r_id.hex}"
    Environment = "dev"
    Owner       = "ratikrishna"
  }
}

#S3 Bucket Object
resource "aws_s3_object" "my_s3_bucket_data" {
  bucket = aws_s3_bucket.my_s3_bucket.bucket
  key    = "myFile.txt"
  source = "myFile.txt"

  etag = filemd5("myFile.txt")
}

#S3 Versioning
resource "aws_s3_bucket_versioning" "my_s3_bucket_versioning" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

#Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "my_s3_bucket_encryption" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#Block Public Access
resource "aws_s3_bucket_public_access_block" "my_s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}