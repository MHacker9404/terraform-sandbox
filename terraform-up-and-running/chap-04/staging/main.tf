terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }
  backend "s3" {
    bucket         = "prb-tuar-state"
    key            = "chap-04/staging/services/web-cluster/terraform.tfstate"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
    region         = "us-east-1"
  }

  required_version = ">= 1.1.6"
}

provider "aws" {
  profile = "PRB-Tools-East1"
  region = "us-east-1"
}

module "web-server-cluster" {
    source = "../modules/services/web-server-cluster"
    cluster_name = "webservers-staging"
}