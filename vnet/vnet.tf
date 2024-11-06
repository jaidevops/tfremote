resource "azurerm_virtual_network" "vnet01" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.vnet_cidr


  tags = {
    environment = var.env
    project = var.project
  }
}