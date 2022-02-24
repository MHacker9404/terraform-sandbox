output "all_users" {
  value = aws_iam_user.example
}

output "all_arns" {
  value = values(aws_iam_user.example)[*].arn
}

output "upper_names" {
  value = [for name in var.users : upper(name)]
}

output "short_upper_names" {
  value = [for name in var.users : upper(name) if length(name) < 5]
}

output "bios" {
  value = [for name, role in var.hero_thousand_faces : "${name} is the ${role}"]
}

output "list_to_map" {
  value = { for name in var.users : name => name }
}

output "map_to_map" {
  value = { for name, role in var.hero_thousand_faces : name => role }
}

output "for_directive" {
  value = <<EOF
    %{~ for name in var.users} ${name} %{~ endfor}
    EOF
}
