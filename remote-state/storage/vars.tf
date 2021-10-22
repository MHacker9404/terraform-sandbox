variable "location" {
  type    = string
  default = "eastus"
}

variable "zones" {
  type    = list(string)
  default = []
}

variable "prefix" {
  type    = string
  default = "prb"
}

variable "ssh_source_address" {
  type    = string
  default = "173.31.65.100/32"
}