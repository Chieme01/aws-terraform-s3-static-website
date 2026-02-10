terraform {
  backend "s3" {
    bucket  = "chieme-test-bucket"
    key     = "chieme-dev-terraform-state/chieme-dev-terraform.tfstate"
    region  = "us-west-2"
    profile = "cptest-test/InfraAdmin"
    workspace_key_prefix = "workspaces"
  }
}