provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_version = ">= 0.12"

  backend "s3" {
    bucket         = "terraform-backend-vivek-anjith"
    key            = "terraform_backend_vivek_anjith_key"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-vivek-anjith"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

module "network" {
  source = "./modules/network"

}

module "cluster" {
  source = "./modules/cluster"

}
