data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_key_pair" "key_pair" {
  key_name = "prb-services-llc-aws"
}

data "template_file" "user_data" {
  # could have done this - kept the sh script in the module
  # template = file(" ${ path.module}/ user-data.sh")
  template = file("./user-data.sh")
  vars = {
    server_port = var.server_port
  }
}
