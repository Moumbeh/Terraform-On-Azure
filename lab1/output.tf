output "application_name" {
  value = var.application_name
}

output "Environment_name" {
  value = var.Environment_name
}

output "resource_prefix" {
  value = local.resource_prefix
}

output "random_string" {
  value = random_string.prefix.result
}

output "api_keys" {
  value = "${var.api_keys}-bar"
  sensitive = true
}