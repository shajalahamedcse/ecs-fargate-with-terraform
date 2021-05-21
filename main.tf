provider "aws" {
  #   access_key = var.aws-access-key
  #   secret_key = var.aws-secret-key
  region  = var.aws-region
  version = "~> 3.0"
}

terraform {
  backend "s3" {
    bucket  = "mw-terraform-backend-store"
    encrypt = true
    key     = "terraform.tfstate"
    region  = "ap-southeast-1"
    # dynamodb_table = "terraform-state-lock-dynamo" - uncomment this line once the terraform-state-lock-dynamo has been terraformed
  }
}

module "vpc" {
  source             = "./vpc"
  name               = var.name
  cidr               = var.cidr
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  availability_zones = var.availability_zones
  environment        = var.environment
}

module "ecr" {
  source          = "./ecr"
  repository_name = var.repository_name
  environment     = var.environment
}
