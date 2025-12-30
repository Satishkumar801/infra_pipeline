resource "azurerm_subnet" "subnet_block" {
  for_each = var.snet
  name = each.value.snet_name
  resource_group_name = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes = each.value.address_prefixes
  
}
variable "snet" {
  type = any
}


# delegation {
#     name = "delegation"

#     service_delegation {
#       name    = "Microsoft.ContainerInstance/containerGroups"
#       actions = ["Microsoft.Network/virtualNetworks/subnets/join/action",
#        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
#     }
#   }