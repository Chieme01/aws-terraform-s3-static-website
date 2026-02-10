variable "bucket_name" {
    description = "Name of S3 bucket."
    default = "chieme-dev-static-web"
}

variable "force_destroy" {
    type = bool
    description = "Indicates all objects (including any locked objects) should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error."
    default = true
}