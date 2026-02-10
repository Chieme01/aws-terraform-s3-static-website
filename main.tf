module "static-website" {
    source = "./modules"
}

resource "aws_s3_object" "object" {
  bucket = module.static-website.bucket_id
  key    = "index.html"
  source = "./index.html"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("./index.html")
  content_type = "text/html; charset=utf-8"
}

resource "aws_s3_object" "object_statement" {
  bucket = module.static-website.bucket_id
  key    = "statement.html"
  source = "./statement.html"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("./index.html")
  content_type = "text/html; charset=utf-8"
}