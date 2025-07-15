resource "random_string" "prefix" {
  length  = 6
  special = false
  upper   = false
}

locals {
  resource_prefix = "${var.application_name}-${var.Environment_name}-${random_string.prefix.result}"
}

# resource "random_string" "numbcount" {
#   count   = length(var.region-set)
#   length  = 6
#   special = false
#   upper   = false
# }
# resource "random_string" "list" {
#   count   = length(var.region-set)
#   length  = 6
#   special = false
#   upper   = false
# }

# resource "random_string" "map" {
#   for_each = var.region_instance_count
#   length  = 6
#   special = false
#   upper   = false
# }

resource "random_string" "if" {
  count = var.enabled ? 1 : 0
  length  = 6
  special = false
  upper   = false
}