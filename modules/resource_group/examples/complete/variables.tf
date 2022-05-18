variable "subscription_id" {
  type        = string
  description = "'az account subscription list - subscriptionId' or 'az account list - id'"
}
variable "client_id" {
  type        = string
  description = "<service principal object-id"
}
variable "client_secret" {
  type        = string
  description = "<service principal/application password"
}
variable "tenant_id" {
  type        = string
  description = "az account list - tenantId"
}

variable "name" {
  type        = string
  description = "Resource Group name"
}
variable "location" {
  type        = string
  description = "Resource Group name"
}