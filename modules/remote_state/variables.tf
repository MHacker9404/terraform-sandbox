variable "location" {
  type = string
}

variable "client" {
  type = string
}

variable "environment" {
  type        = string
  default     = null
  description = "ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT'"
}

# service principal
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

variable "group_name" {
  type = string
  description = "AD group name"
}
