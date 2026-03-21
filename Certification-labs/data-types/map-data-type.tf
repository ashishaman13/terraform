variable "my-map" {
  type = map
}

output "variable_value" {
    value = var.my-map
}