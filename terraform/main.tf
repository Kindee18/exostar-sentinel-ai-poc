provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "poc" {
  name     = "exostar-poc-rg"
  location = "East US"
}

# [ALERT] SECURITY VIOLATION (FOR DEMO): Public access enabled on a storage account
resource "azurerm_storage_account" "insecure" {
  name                     = "exostarinsecuresa${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.poc.name
  location                 = azurerm_resource_group.poc.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # The "Insecure" configuration we want our AI/Sentinel to fix
  public_network_access_enabled = false
  allow_nested_items_to_be_public = false

  tags = {
    environment = "poc-demo"
    owner       = "aegis-agent"
  }
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

output "storage_account_name" {
  value = azurerm_storage_account.insecure.name
}
