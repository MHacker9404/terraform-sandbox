terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }

  required_version = ">= 1.1.6"
}

resource "aws_launch_configuration" "web-server-cluster" {
  image_id        = "ami-04505e74c0741db8d"
  instance_type   = "t2.micro"
  key_name        = data.aws_key_pair.key_pair.key_name
  security_groups = [aws_security_group.web-server-cluster.id]

  user_data = data.template_file.user_data.rendered

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web-server-asg" {
  launch_configuration = aws_launch_configuration.web-server-cluster.name
  vpc_zone_identifier  = data.aws_subnets.default.ids
  target_group_arns    = [aws_lb_target_group.asg-tg.arn]
  health_check_type    = "ELB"

  min_size = 2
  max_size = 10
  tag {
    key                 = "Name"
    value               = "${var.cluster_name}-terraform-asg-example"
    propagate_at_launch = true
  }
  tag {
    key                 = "Tag Two"
    value               = "${var.cluster_name}-terraform-asg-example"
    propagate_at_launch = true
  }
  dynamic "tag" {
    for_each = var.custom_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_security_group" "web-server-cluster" {
  name = "${var.cluster_name}-web-server-cluster-sg"
  ingress {
    description = "global access"
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.my_ip
  }
}

resource "aws_lb" "web-server-alb" {
  name               = "${var.cluster_name}-alb"
  load_balancer_type = "application"
  subnets            = data.aws_subnets.default.ids
  security_groups    = [aws_security_group.alb-sg.id]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web-server-alb.arn
  port              = local.http_port
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
  name = "${var.cluster_name}-alb-sg"
  #   see below
  #   ingress {
  #     description = "limited access"
  #     from_port   = local.http_port
  #     to_port     = local.http_port
  #     protocol    = local.tcp_protocol
  #     cidr_blocks = local.all_ips
  #   }
  #   egress {
  #     description = "all outbound"
  #     from_port   = local.any_port
  #     to_port     = local.any_port
  #     protocol    = local.any_protocol
  #     cidr_blocks = local.all_ips
  #   }
}

resource "aws_security_group_rule" "allow_http_indbound" {
  type              = "ingress"
  security_group_id = aws_security_group.alb-sg.id
  description       = "limited access"
  from_port         = local.http_port
  to_port           = local.http_port
  protocol          = local.tcp_protocol
  cidr_blocks       = local.all_ips
}
resource "aws_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.alb-sg.id
  description       = "all outbound"
  from_port         = local.any_port
  to_port           = local.any_port
  protocol          = local.any_protocol
  cidr_blocks       = local.all_ips
}

resource "aws_lb_target_group" "asg-tg" {
  name     = "${var.cluster_name}-alb-tg"
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
