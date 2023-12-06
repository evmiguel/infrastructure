terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.29.0"
    }
  }
  backend "s3" {
    bucket         = "erika-terraform"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}