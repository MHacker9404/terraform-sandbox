terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }

  backend "s3" {
    bucket         = "prb-tuar-state"
    key            = "chap-05/global/iam/terraform.tfstate"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
    region         = "us-east-1"
  }

  required_version = ">= 1.1.6"
}

provider "aws" {
  profile = "PRB-Tools-East1"
  region  = "us-east-1"
}

resource "aws_iam_user" "example" {
#   count = length(var.users)
#   name  = var.users[count.index]
    for_each = toset(var.users)
    name = each.value
}
