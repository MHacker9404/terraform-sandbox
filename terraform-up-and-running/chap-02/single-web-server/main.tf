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

resource "aws_instance" "single-web-server" {
  ami                    = "ami-04505e74c0741db8d"
  instance_type          = "t2.micro"
  key_name = data.aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.single-web-server.id]
  tags = {
    Name    = "terraform-up-and-running"
    Chapter = "02"
    Lab     = "single-web-server"
  }

  user_data = <<-EOF
#!/bin/bash
echo "Hello world" > index.html
nohup busybox httpd -f -p ${var.server_port} &
EOF

}

resource "aws_security_group" "single-web-server" {
  ingress {
    description = "global access"
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["173.31.65.100/32"]
  }
}

data "aws_key_pair" "key_pair" {
  key_name = "prb-services-llc-aws"
}

variable "server_port" {
  type        = number
  description = "The port the server use for HTTP requests"
  default     = 8080
}

output "public_ip" {
  value       = aws_instance.single-web-server.public_ip
  description = "The public IP address of the web server"
}
