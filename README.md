# aws-terraform-s3-static-website
AWS Static Website with Terraform
This repository contains a modular Terraform configuration to deploy a high-performance, secure, and "aesthetic" static website on AWS. By leveraging Amazon S3 for storage and CloudFront as a CDN, this setup ensures your site is fast, globally available, and follows security best practices by keeping the S3 bucket private.

Architecture
Amazon S3: Hosts the static HTML/CSS/JS files. Public access is fully blocked.

Amazon CloudFront (CDN): Serves the content from the S3 bucket via Origin Access Control (OAC).

Route 53 (DNS): Directs traffic from root domain to Content Delivery Network.

Bucket Policy: A strictly scoped bucket policy that allows only the specific CloudFront distribution to read objects.

Modern Infrastructure: Uses Terraform's latest practices, including the -replace workflow for resource updates.

Prerequisites
AWS CLI configured with appropriate permissions.

Terraform (v1.0+) installed.

(Optional) Git Bash for Windows users to use the tf alias.

Getting Started
1. Clone the repository
Bash
git clone https://github.com/Chieme01/aws-terraform-s3-static-website.git
cd aws-terraform-s3-static-website

2. Initialize Terraform
Bash
terraform init

3. Deploy the Infrastructure
Bash
terraform plan
terraform apply 
