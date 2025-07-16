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
  value     = "${var.api_keys}-bar"
  sensitive = true
}

output "primary_region" {
  value = var.regions[3]
}

output "multi-regions" {
  value = var.region-set
}
output "primary_region_instances" {
  value = var.region_instance_count
}

output "vnet_name" {
  value = var.vnet.vnet_name
}

output "subnet_name" {
  value = var.vnet.subnet_name
}

output "ours" {
  value = module.ours.random_string_id
}