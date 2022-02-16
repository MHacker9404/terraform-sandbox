output "password" {
  value=resource_type.resource_name.password
  description = "the password for logging in"
  sensitive = true
  depends_on = [ resource_type.another_resource_name ]
}