resource "azurerm_linux_virtual_machine" "vm_block" {
  for_each = var.vm
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.vm_location
  size                = each.value.vm_size
  admin_username      = data.azurerm_key_vault_secret.vm_username.value
  admin_password = data.azurerm_key_vault_secret.vm_password.value
  disable_password_authentication = false
  network_interface_ids = [data.azurerm_network_interface.data_nic[each.key].id]
  

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

data "azurerm_network_interface" "data_nic" {
  for_each = var.vm
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_network_interface" "data_nic1" {
  for_each = var.vm
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault" "kv" {
  name                = "imp-kv-dev-001"
  resource_group_name = "satish_rg111"
}
data "azurerm_key_vault_secret" "vm_username" {
  name         = "vmusername"
  key_vault_id = data.azurerm_key_vault.kv.id
}
data "azurerm_key_vault_secret" "vm_password" {
  name         = "vmpassword"
  key_vault_id = data.azurerm_key_vault.kv.id
}


variable "vm" {
  type = any
}