# Download the provider files for AWS

terraform {

  backend "s3" {
    bucket         = "pankaj-cc-tf-state-backend-ci-cd"
    key            = "tf-infra/terraform.tfstate"

    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.30.0"
    }
  }
}


provider "aws" {

  region = var.AWS_REGION
}


provider "aws" {

  alias  = "aws_west"
  region = var.AWS_SECOND_REGION

}
