provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

# 1️⃣ Création du Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-data-engineeringAZ${random_integer.suffix.result}"
  location = "East US"
}

# 2️⃣ Création du Storage Account pour Azure Data Lake
resource "azurerm_storage_account" "datalake" {
  name                     = "datalakestorageazz${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true  # Activer Hierarchical Namespace pour ADLS Gen2
}


# 4️⃣ Création de la base de données SQL Azure
resource "azurerm_sql_database" "sqldb" {
  name                = "sqldbazz${random_integer.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_sql_server.sqlserver.name
  sku_name            = "Basic"
}



resource "azurerm_data_factory" "adf" {
  name                = "adf-dataengazz${random_integer.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}


resource "azurerm_databricks_workspace" "databricks" {
  name                = "databricks-dataengAzz"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "standard"
}

variable "subscription_id" {
  description = "ID de la souscription Azure"
  type        = string
}

output "adls_url" {
  value = azurerm_storage_account.datalake.primary_blob_endpoint
}

output "sqldb_connection_string" {
  value = "Server=tcp:${azurerm_sql_server.sqlserver.fully_qualified_domain_name};Database=${azurerm_sql_database.sqldb.name};User ID=adminuser;Password=YourPassword123!;Encrypt=true;TrustServerCertificate=false;Connection Timeout=30;"
}
