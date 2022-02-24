variable "key_name" {
  type        = string
  description = "key_pair name"
  default     = "prb-services-llc-aws"
}

data "aws_key_pair" "key_pair" {
  key_name = var.key_name
}

output "key_pair" {
  value = data.aws_key_pair.key_pair
}
