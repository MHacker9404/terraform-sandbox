output "alb_dns_name" {
  value = aws_lb.web-server-alb.dns_name
}

output "asg_name" {
    value = aws_autoscaling_group.web-server-asg.name
    description = "The name of the Auto Scaling Group"
}

output "alb_sg_id" {
    value = aws_security_group.alb-sg.id
}