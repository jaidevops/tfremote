resource "azurerm_storage_account" "stg01" {
  name                     = var.name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.tier
  account_replication_type = var.replica_type

  network_rules {
    default_action             = "Deny"
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.subnet_ids
  }

  tags = {
    environment = var.env
    project = var.project
  }
}

resource "azurerm_storage_container" "con1" {
  name                  = var.blob1_name
  storage_account_name  = azurerm_storage_account.stg01.name
  container_access_type = "private"
}

resource "azurerm_private_endpoint" "pe01" {
  name                = var.pe01_name
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.pesub1_id

  private_service_connection {
    name                           = var.pr_scname
    private_connection_resource_id = azurerm_storage_account.stg01.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "dns-group-stg01"
    private_dns_zone_ids = var.pdns_id
  }
}