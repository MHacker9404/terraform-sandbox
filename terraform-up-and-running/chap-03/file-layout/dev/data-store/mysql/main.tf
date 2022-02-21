terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }
  backend "s3" {
    bucket         = "prb-tuar-state"
    key            = "dev/data-store/mysql/terraform.tfstate"
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

resource "aws_db_instance" "back-end" {
  identifier_prefix = "terraform-up-and-running"
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  db_name           = "terraform_up_and_running"
  username          = "admin"
  # how do we set the password
  password = data.aws_ssm_parameter.mysql_admin_password.value
}
