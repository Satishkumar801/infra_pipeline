resource "azurerm_mssql_server" "sql_server" {
    for_each = var.sqlserver
  name                         = each.value.server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.server_location
  version                      = "12.0"
  administrator_login          = "serveradministrator"
  administrator_login_password = "Satish@123"
  minimum_tls_version          = "1.2"

#   azuread_administrator {
#     login_username = "AzureAD Admin"
#     object_id      = "00000000-0000-0000-0000-000000000000"
#   }

#   tags = {
#     environment = "production"
#   }
}

variable "sqlserver" {
  type = any
}