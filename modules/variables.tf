variable "bucket_name" {
    description = "Name of S3 bucket."
    default = "static-web-bucket"
}

variable "force_destroy" {
    type = bool
    description = "Indicates all objects (including any locked objects) should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error."
    default = true
}

variable "distribution_name" {
    description = "Name of cloudfront distribution."
    default = "website-distribution"
}

variable "default_index_document" {
    description = "Name of the index document for the website. Also Object that you want CloudFront to return when an end user requests the root URL."
    default = "index.html"
}

variable "cache_policy_id" {
  description = "Unique identifier of the cache policy that is attached to the cache behavior."
  # https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html
  default = "658327ea-f89d-4fab-a63d-7e88639e58f6" # CachingOptimized managed cache policy
  # "4135ea2d-6df8-44a3-9df3-4b5a84be39ad" #CachingDisabled managed cache policy.
  # "658327ea-f89d-4fab-a63d-7e88639e58f6" #CachingOptimized managed cache policy.
}

variable "price_class" {
    description = "Limits where in the world your data is cached to save money on regional bandwidth."
    default = "PriceClass_100"
    validation {
        condition     = contains(["PriceClass_100", "PriceClass_200", "PriceClass_All"], var.price_class)
        error_message = "Valid values for price_class are (PriceClass_100, PriceClass_200, PriceClass_All)."
  }
}

variable "web_acl_id" {
    description = "You can't remove or replace the web ACL for your distribution. Distributions with a pricing plan subscription must have a web ACL resource."
    default = null
}

variable "distribution_aliases" {
    description = "List of other domains that CloudFront distribution will respond to."
    type = list(string)
    default = null
}

variable "registered_root_domain" {
    description = ""
}

variable "block_public_website_access" {
    default = true
    type = bool
}