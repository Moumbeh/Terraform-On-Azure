resource "random_string" "prefix" {
  length  = 6
  special = false
  upper   = false
}

locals {
  resource_prefix = "${var.application_name}-${var.Environment_name}-${random_string.prefix.result}"
}