# Virtual netywork
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.application_name}-${var.environment_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space
  tags                = local.common_tags
}

