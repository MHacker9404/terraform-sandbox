terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }

  required_version = ">= 1.1.6"
}

provider "aws" {
  profile = "PRB-Tools-East1"
  region  = "us-east-1"
}

resource "aws_instance" "single-server" {
  ami           = "ami-033b95fb8079dc481"
  instance_type = "t2.micro"
  tags = {
      Name = "terraform-up-and-running"
      Chapter = "02"
      Lab = "single-server"
  }
}
