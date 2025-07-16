resource "random_string" "prefix" {
  length  = 6
  special = false
  upper   = false
}

locals {
  resource_prefix = "${var.application_name}-${var.Environment_name}-${random_string.prefix.result}"
}

/*
hdk
*/

# resource "random_string" "numbcount" {
#   count   = length(var.regions)
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

resource "random_string" "map" {
  for_each = var.region_instance_count
  length  = 6
  special = false
  upper   = false
}

# resource "random_string" "if" {
#  count = 1
#   length  = 6
#   special = false
#   upper   = false
# }

#terraform apply
# module "h-random" {
#   source  = "hashicorp/module/random"
#   version = "1.0.0"
# }

# module "module" {
#   source  = "hashicorp/module/random"
#   version = "1.0.0"
# }
module "ours" {
  source = "./module/random"
}

# module "ours1" {
#   source = "./module/random"
# }