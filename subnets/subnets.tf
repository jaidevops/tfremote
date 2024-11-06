resource "azurerm_subnet" "sub01" {
  name                 = var.sub1_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.sub1_cidr
  service_endpoints    = ["Microsoft.Storage"]

}

resource "azurerm_subnet_network_security_group_association" "sub01" {
  subnet_id                 = azurerm_subnet.sub01.id
  network_security_group_id = var.nsg01_id
}

resource "azurerm_subnet" "sub02" {
  name                 = var.sub2_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.sub2_cidr
  service_endpoints    = ["Microsoft.Storage"]

}

resource "azurerm_subnet_network_security_group_association" "sub02" {
  subnet_id                 = azurerm_subnet.sub02.id
  network_security_group_id = var.nsg02_id
}