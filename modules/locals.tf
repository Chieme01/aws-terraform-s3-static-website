locals {
  origin = var.block_public_website_access ? aws_s3_bucket.website_bucket.bucket_regional_domain_name : aws_s3_bucket_website_configuration.s3_website_configuration[0].website_endpoint
  bucket_domain = var.block_public_website_access ? aws_s3_bucket.website_bucket.bucket_regional_domain_name : aws_s3_bucket_website_configuration.s3_website_configuration[0].website_domain
} 