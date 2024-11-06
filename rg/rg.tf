resource "azurerm_resource_group" "rg01" {
  name     = var.name
  location = var.location

  tags = {
    environment = var.env
    project = var.project
  }
}