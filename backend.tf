terraform {
  backend "s3" {
    bucket  = "nyon-terraform-state-bucket"
    key     = "chieme-dev-terraform-state/chieme-dev-terraform.tfstate"
    region  = "us-west-1"
    #profile = var.aws_profile
    workspace_key_prefix = "workspace"
  }
}