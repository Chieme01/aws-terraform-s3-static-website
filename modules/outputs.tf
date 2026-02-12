output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.s3_website_configuration.website_endpoint
}

output "website_domain" {
  value = aws_s3_bucket_website_configuration.s3_website_configuration.website_domain
}

output "bucket_id" {
  value = aws_s3_bucket.website_bucket.id
}

output "distribution_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "distribution_hosted_zone_id" {
  value = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
}