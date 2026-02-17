resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
  force_destroy = var.force_destroy

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_public_access_setting" {
  bucket = aws_s3_bucket.website_bucket.id
  block_public_policy     = var.block_public_website_access
  restrict_public_buckets = var.block_public_website_access
  block_public_acls       = var.block_public_website_access
  ignore_public_acls      = var.block_public_website_access

}

resource "aws_s3_bucket_policy" "website_bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id
  policy = var.block_public_website_access? data.aws_iam_policy_document.block_public_access.json : data.aws_iam_policy_document.allow_public_access.json
  depends_on = [ aws_s3_bucket_public_access_block.s3_public_access_setting ]
}

data "aws_iam_policy_document" "block_public_access" {
  statement {
    sid    = "AllowCloudFrontServicePrincipalReadOnly"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.website_bucket.arn}/*",
    ]

    condition {
      test = "StringEquals"
      variable = "AWS:SourceArn"
      values = [ aws_cloudfront_distribution.s3_distribution.arn  ]
    }
  }
}

resource "aws_s3_bucket_website_configuration" "s3_website_configuration" {
  count   = var.block_public_website_access ? 0 : 1
  
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = var.default_index_document
  }

  # error_document {
  #   key = "error.html"
  # }

  # # Todo
  # routing_rule {
  #   condition {
  #     key_prefix_equals = "docs/"
  #   }
  #   redirect {
  #     replace_key_prefix_with = "documents/"
  #   }
  # }
}

data "aws_iam_policy_document" "allow_public_access" {
  statement {
    sid    = "PublicReadGetObject"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.website_bucket.arn}/*",
    ]
  }
}