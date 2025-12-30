resource "azurerm_mssql_database" "sql_database" {
    for_each = var.sqldatabase
  name         = each.value.db_name
  server_id    = data.azurerm_mssql_server.data_server[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

#   tags = {
#     foo = "bar"
#   }

  # prevent the possibility of accidental data loss
#   lifecycle {
#     prevent_destroy = true
#   }
}

data "azurerm_mssql_server" "data_server" {
    for_each = var.sqldatabase
  name                = each.value.server_name
  resource_group_name = each.value.rg_name
}

variable "sqldatabase" {
  type = any
}