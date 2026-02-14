output "website_endpoint" {
  value = local.origin
}

output "website_domain" {
  value = local.bucket_domain
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