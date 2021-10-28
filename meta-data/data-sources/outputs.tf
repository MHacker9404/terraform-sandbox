output "users" {
  value = [for u in data.azuread_user.user : u.object_id]
  # value = [for u in var.users : u]
}
