provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_version = ">= 0.12"

  backend "s3" {
    bucket         = "terraform-ecr-backend-vivek-anjith"
    key            = "terraform_backend_vivek_anjith_key"
    region         = "ap-south-1"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
  }
    }
}

resource "aws_ecr_repository" "todo_app" {
  name                 = "todo_app_vivek_anjith"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}