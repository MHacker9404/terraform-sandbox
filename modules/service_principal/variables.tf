variable "client" {
  type    = string
  description = "Client name"
}

variable "environment" {
  type        = string
  default     = null
  description = "ID element. Usually used for region e.g. 'eastus', 'westus', OR role 'prod', 'staging', 'dev', 'UAT'"
}

variable "app_name" {
  type        = string
  default     = null
  description = <<-EOT
    Name for the Service Principal - to override the default
    EOT
}

variable "pw_duration" {
  type        = number
  default     = 4320
  description = <<-EOT
    Relative duration (hours) for password
    EOT
}

variable "role" {
  type        = string
  description = "The name of a built-in Role"
}