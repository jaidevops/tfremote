resource "azurerm_network_security_group" "nsg01" {
  name                = var.nsg01_name
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "sshLinux"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = var.env,
    project = var.project
  }
}

resource "azurerm_network_security_group" "nsg02" {
  name                = var.nsg02_name
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "RDPVM"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "49.206.58.48"
    destination_address_prefix = "3389"
  }

  tags = {
    environment = var.env,
    project = var.project
  }
}