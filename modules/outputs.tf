output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.s3_website_configuration.website_endpoint
}

output "website_domain" {
  value = aws_s3_bucket_website_configuration.s3_website_configuration.website_domain
}

output "bucket_id" {
  value = aws_s3_bucket.s3_bucket.id
}