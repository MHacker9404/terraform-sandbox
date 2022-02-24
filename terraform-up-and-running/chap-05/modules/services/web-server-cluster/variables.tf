variable "server_port" {
  type    = number
  default = 8080
}

variable "cluster_name" {
    type = string
    description = "The name to use for all the cluster resources"
}

variable "custom_tags" {
    type = map(string)
    description = "Custom tags to set on the instances in the ASG"
    default = {}
}