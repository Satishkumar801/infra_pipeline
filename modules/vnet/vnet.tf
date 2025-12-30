resource "azurerm_virtual_network" "vnet_block" {
  for_each = var.vnet
  name = each.value.vnet_name
  resource_group_name = each.value.rg_name
  location = each.value.vnet_location
  address_space = each.value.address_space
  dns_servers = each.value.dns_servers
}

variable "vnet" {
  type = any
}