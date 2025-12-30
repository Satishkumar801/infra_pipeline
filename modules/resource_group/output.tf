output "resource_group_name" {
  value = {for k, rg in azurerm_resource_group.rg_block: k=> rg.name}
}
output "resource_group_location" {
  value = {for k, rg in azurerm_resource_group.rg_block: k=> rg.location}
}
  
