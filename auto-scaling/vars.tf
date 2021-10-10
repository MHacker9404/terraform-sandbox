variable "location" {
  type    = string
  default = "eastus"
}

variable "prefix" {
  type    = string
  default = "prb"
}

variable "ssh-source-address" {
  type    = string
  default = "173.31.65.100/32"
}

variable "zones" {
  type = list(string)
  default = [  ]
}
