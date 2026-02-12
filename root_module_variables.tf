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