variable "name" {
  type = string
  description = "(Required) The name of the parameter"
}
variable "type" {
  type = string
  description = "(Required) The type of the parameter. Valid types: String | StringList | SecureString"
}
variable "value" {
  type = string
  description = "(Required) The value of the parameter. This value is always marked as sensitive in the Terraform plan output"
}