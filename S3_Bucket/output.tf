output "s3_bucket_name" {
  description = "Name of the S3 Bucket"
  value       = aws_s3_bucket.my_s3_bucket.bucket
}