resource "azurerm_network_interface" "nic_block" {
    for_each = var.nic
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_snet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.data_pip[each.key].id
  }
}
data "azurerm_subnet" "data_snet" {
    for_each = var.nic
  name                 = each.value.snet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "data_pip" {
    for_each = var.nic
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

variable "nic" {
  type = any
}
