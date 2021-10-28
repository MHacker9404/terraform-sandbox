# defines all variables used by the plans

variable "location" {
  type    = string
  default = "usgovvirginia"
}

variable "zones" {
  type    = list(string)
  default = []
}

variable "app-rgp-01" {
  type  = string
}

variable "prefix" {
  type    = string
  default = "ESDS"
}

variable "suffix" {
  type    = string
  default = "zone-c"
}

variable "ssh_source_address" {
  type    = string
  default = "173.31.65.100/32"
}