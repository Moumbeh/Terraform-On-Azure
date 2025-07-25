locals {
  owner            = var.business_unit
  environment_name = var.environment_name
  common_tags = {
    owner_name = "Valery"
    Team_name  = "avengers"
  }
}