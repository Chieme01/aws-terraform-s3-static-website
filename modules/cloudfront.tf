resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = "cloudfront-oac"
  description                       = "Prevent public from bypassing cloudfront and accessing origin directly"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  aliases             = var.distribution_aliases
  comment             = null
  default_root_object = var.default_index_document
  enabled             = true
  http_version        = "http2"
  is_ipv6_enabled     = true
  price_class         = var.price_class
  retain_on_delete    = false
  tags = {
    Name = var.distribution_name
  }
  tags_all = {
    Name = var.distribution_name
  }
  wait_for_deployment = true
  web_acl_id          = var.web_acl_id
  default_cache_behavior {
    allowed_methods            = ["GET", "HEAD"]
    cache_policy_id            = var.cache_policy_id
    cached_methods             = ["GET", "HEAD"]
    compress                   = true
    default_ttl                = 0
    field_level_encryption_id  = null
    max_ttl                    = 0
    min_ttl                    = 0
    origin_request_policy_id   = null
    realtime_log_config_arn    = null
    response_headers_policy_id = null
    smooth_streaming           = false
    target_origin_id           = local.origin
    trusted_signers            = []
    viewer_protocol_policy     = "redirect-to-https"
  }
  origin {
    connection_attempts      = 3
    connection_timeout       = 10
    domain_name              = local.origin
    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
    origin_id                = local.origin
    origin_path              = null
    # custom_origin_config {
    #   http_port                = 80
    #   https_port               = 443
    #   origin_keepalive_timeout = 5
    #   origin_protocol_policy   = "http-only"
    #   origin_read_timeout      = 30
    #   origin_ssl_protocols     = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
    # }
  }
  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn            = aws_acm_certificate_validation.cert_verify.certificate_arn
    cloudfront_default_certificate = false #true
    iam_certificate_id             = null
    minimum_protocol_version       = "TLSv1.2_2021" #"TLSv1"
    ssl_support_method             = "sni-only"
  }
}
