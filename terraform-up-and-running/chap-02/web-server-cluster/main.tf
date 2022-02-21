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

resource "aws_launch_configuration" "web-server-cluster" {
  image_id        = "ami-033b95fb8079dc481"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web-server-cluster.id]

  user_data = <<-EOF

EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web-server-asg" {
  launch_configuration = aws_launch_configuration.web-server-cluster.name
  vpc_zone_identifier  = data.aws_subnet_ids.default.ids
  target_group_arns    = [aws_lb_target_group.asg-tg.arn]
  health_check_type    = "ELB"

  min_size = 2
  max_size = 10
  tags = [
    {
      key                 = "Name"
      value               = "terraform-asg-example"
      propagate_at_launch = true
    }
  ]
}

resource "aws_security_group" "web-server-cluster" {
  ingress {
    description = "global access"
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["173.31.65.100/32"]
  }
}

resource "aws_lb" "web-server-alb" {
  name               = "terraform-asg-example"
  load_balancer_type = "application"
  subnets            = data.aws_subnet_ids.default.ids
  security_groups    = [aws_security_group.alb-sg.id]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web-server-alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}

resource "aws_lb_listener_rule" "alb-rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100
  condition {
    path_pattern {
      values = ["*"]
    }
  }
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg-tg.arn
  }
}
resource "aws_security_group" "alb-sg" {
  name = "terraform-example-alb"
  ingress {
    description = "limited access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_lb_target_group" "asg-tg" {
  name     = "terraform-asg-example"
  port     = var.server_port
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

data "aws_vpc" "default" {
  default = true
}
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

variable "server_port" {
  type        = number
  description = "The port the server use for HTTP requests"
  default     = 8080
}

output "alb_dns_name" {
    value = aws_lb.web-server-alb.dns_name
}