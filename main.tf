module "static-website" {
    source = "./modules"
    bucket_name = var.bucket_name
}

resource "aws_s3_object" "object" {
  bucket = module.static-website.bucket_id
  key    = "index.html"
  source = "./html/index.html"
  etag = filemd5("./html/index.html")
  content_type = "text/html; charset=utf-8"
}

resource "aws_s3_object" "object_statement" {
  bucket = module.static-website.bucket_id
  key    = "statement.html"
  source = "./html/statement.html"
  etag = filemd5("./html/index.html")
  content_type = "text/html; charset=utf-8"
}