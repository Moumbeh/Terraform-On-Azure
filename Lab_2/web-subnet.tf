# web subnet
resource "azurerm_subnet" "web-subnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.web-subnet}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.web-subnet-address_prefixes


}

# 2 security group

resource "azurerm_network_security_group" "web-nsg" {
  name                = "${azurerm_subnet.web-subnet.name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# 4 ports to be open
locals {
  web-subnet-nsg-rule-map = {
    "100" : "80", # if the key starts with a number, you must use column syntax
    "110" : "443",
    "120" : "22"
  }
}

# 3 Security Rule
resource "azurerm_network_security_rule" "web-nsg-inbound-rule" {
  for_each                    = local.web-subnet-nsg-rule-map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.web-nsg.name
}

#4 nsg association

resource "azurerm_subnet_network_security_group_association" "web-subnet-association" {
  depends_on                = [azurerm_network_security_rule.web-nsg-inbound-rule]
  subnet_id                 = azurerm_subnet.web-subnet.id
  network_security_group_id = azurerm_network_security_group.web-nsg.id
}