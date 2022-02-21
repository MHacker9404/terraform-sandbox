terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }
  backend "s3" {
    bucket         = "prb-tuar-state"
    key            = "chap-04/production/services/web-cluster/terraform.tfstate"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
    region         = "us-east-1"
  }

  required_version = ">= 1.1.6"
}

provider "aws" {
  profile = "PRB-Tools-East1"
  region = "us-east-1"
}

module "web-server-cluster" {
    source = "../modules/services/web-server-cluster"
    cluster_name = "webservers-prod"
}

resource "aws_autoscaling_schedule" "scale_out" {
    scheduled_action_name = "scale-out-during-business-hours"
    autoscaling_group_name = module.web-server-cluster.asg_name
    min_size = 2
    max_size = 10
    desired_capacity = 10
    recurrence = "0 9 * * *"
}

resource "aws_autoscaling_schedule" "scale_in" {
    scheduled_action_name = "scale-in-at-night"
    autoscaling_group_name = module.web-server-cluster.asg_name
    min_size = 2
    max_size = 10
    desired_capacity = 2
    recurrence = "0 17 * * *"
}