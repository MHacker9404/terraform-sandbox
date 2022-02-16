terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "PRB-Tools-East1"
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-01893222c83843146"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform Example Instance"
  }
}
