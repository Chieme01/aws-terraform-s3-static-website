module "static-website" {
    source                  = "./modules"
    bucket_name             = var.bucket_name
    distribution_name       = var.distribution_name
    price_class             = var.price_class
    web_acl_id              = var.web_acl_id
    registered_root_domain  = var.registered_root_domain
    distribution_aliases    = var.distribution_aliases
    cache_policy_id         = var.cache_policy_id

    # Pass BOTH the default and the aliased provider
    providers = {
      aws       = aws       # Passes us-west-1
      aws.east  = aws.east  # Passes us-east-1
    }
}

resource "aws_s3_object" "object" {
  bucket = module.static-website.bucket_id
  key    = "index.html"
  source = "./html/index.html"
  etag = filemd5("./html/index.html")
  content_type = "text/html; charset=utf-8"
  depends_on = [ module.static-website ]
}

resource "aws_s3_object" "resume_object" {
  bucket = module.static-website.bucket_id
  key    = "resume.html"
  source = "./html/resume.html"
  etag = filemd5("./html/resume.html")
  content_type = "text/html; charset=utf-8"
  depends_on = [ module.static-website ]
}