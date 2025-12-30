resource "azurerm_public_ip" "pip_block" {
  for_each = var.pip
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
  location            = each.value.pip_location
  allocation_method   = each.value.allocation_method

#   tags = {
#     environment = "Production"
#   }
}

variable "pip" {
  type = any
}

