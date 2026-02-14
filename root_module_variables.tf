# variable "aws_profile" {}

variable "bucket_name" {
    description = "Name of S3 bucket."
}

variable "distribution_name" {
    description = "Name of cloudfront distribution."
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
}

variable "registered_root_domain" {
    description = ""
    default     = null
}

variable "distribution_aliases" {
    description = "List of other domains that CloudFront distribution will respond to."
    type = list(string)
    default = null
}

variable "cache_policy_id" {
  description = "Unique identifier of the cache policy that is attached to the cache behavior."
  # https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html
  default = "658327ea-f89d-4fab-a63d-7e88639e58f6" # CachingOptimized managed cache policy
  # "4135ea2d-6df8-44a3-9df3-4b5a84be39ad" #CachingDisabled managed cache policy.
  # "658327ea-f89d-4fab-a63d-7e88639e58f6" #CachingOptimized managed cache policy.
}