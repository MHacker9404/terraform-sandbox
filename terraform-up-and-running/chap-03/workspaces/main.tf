terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }
  backend "s3" {
    bucket         = "prb-tuar-state"
    key            = "terraform-up-and-running/workspaces/terraform.tfstate"
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

resource "aws_instance" "single-server" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.key_pair.key_name
  tags = {
    Name    = "terraform-up-and-running"
    Chapter = "02"
    Lab     = "single-server"
  }
}

data "aws_key_pair" "key_pair" {
  key_name = "prb-services-llc-aws"
}

output "aws_instance_arn" {
  value = aws_instance.single-server.arn
}
