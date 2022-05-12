resource "random_pet" "pets" {
  # for_each = {
  #   dc1apps = "PRB"
  #   dc2apps = "RPB"
  #   dc3apps = "CIB"
  # }
  length    = 1
  prefix    = "PRB"
  separator = "-"
}
