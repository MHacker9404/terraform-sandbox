data "terraform_remote_state" "db_state" {
  backend = "s3"
  config = {
    bucket = "prb-tuar-state"
    key    = "dev/data-store/mysql/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_key_pair" "key_pair" {
  key_name = "prb-services-llc-aws"
}

data "template_file" "user_data" {
  template = file("user-data.sh")
  vars = {
    server_port = var.server_port
    db_address  = data.terraform_remote_state.db_state.outputs.address
    db_port     = data.terraform_remote_state.db_state.outputs.port
  }
}
