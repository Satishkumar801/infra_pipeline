# resource "azurerm_key_vault" "keyvault_block" {
#   for_each = var.keyvault
#   name                        = each.value.keyvault_name
#   location                    = each.value.keyvault_location
#   resource_group_name         = each.value.rg_name
#   enabled_for_disk_encryption = true
#   tenant_id                   = data.azurerm_client_config.current.client_id
#   soft_delete_retention_days  = 30
#   purge_protection_enabled    = false

#   sku_name = "standard"

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = [
#       "Get",
#     ]

#     secret_permissions = [
#       "Get",
#     ]

#     storage_permissions = [
#       "Get",
#     ]
#   }
# }
# resource "azurerm_key_vault_secret" "secret" {
#   name         = "vmusername"
#   value        = ""
#   key_vault_id = azurerm_key_vault.example.id
# }


# data "azurerm_client_config" "current" {}

# variable "keyvault" {}