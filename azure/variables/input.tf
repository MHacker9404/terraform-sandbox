variable "myvariable" {
  description = "this is myvariable, it's a string"
  type        = string
  default     = "123"
}

variable "parameters" {
  type = list(object({
    prefix = string
    parameters = list(object({
      name  = string
      value = string
    }))
  }))
  default = []
}

variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [{
    external = 8300
    internal = 8300
    protocol = "tcp"
  }]
}

variable "server_id" {
  type        = string
  description = "the id of the server"
  validation {
    condition     = length(var.server_id) > 4 && substr(var.server_id, 0, 4) == "srv-"
    error_message = "The server_id value must be a valid server id, starting with \"srv-\"."
  }
}

variable "password" {
  type      = string
  sensitive = true
}
