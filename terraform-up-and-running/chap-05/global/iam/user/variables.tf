variable "users" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}

variable "hero_thousand_faces" {
    type = map(string)
    default = {
        neo = "hero"
        trinity = "love interest"
        morpeus = "mentor"
    }
}