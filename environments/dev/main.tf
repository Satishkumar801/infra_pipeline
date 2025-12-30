module "rg_block" {
  source   = "../../modules/resource_group"
  rg_group = var.rgs
}
module "vnet_block" {
  depends_on = [module.rg_block]
  source     = "../../modules/vnet"
  vnet       = var.vnets

}
module "subnet_block" {
  depends_on = [module.vnet_block]
  source     = "../../modules/subnet"
  snet       = var.snets
}
module "pip_block" {
  depends_on = [module.rg_block]
  source     = "../../modules/pip"
  pip        = var.pips

}
module "nic_block" {
  depends_on = [module.subnet_block, module.pip_block]
  source     = "../../modules/nic"
  nic        = var.nics
}
module "vm_block" {
  depends_on = [module.nic_block]
  source     = "../../modules/vm"
  vm         = var.vms
}
module "sql_server" {
  depends_on = [module.rg_block]
  source     = "../../modules/mssql_servers"
  sqlserver  = var.servers
}
module "sql_db" {
  depends_on  = [module.sql_server]
  source      = "../../modules/sql_database"
  sqldatabase = var.dbs
}
module "nsg_block" {
  depends_on = [ module.rg_block ]
  source = "../../modules/nsg"
  nsg    = var.nsg
}

# module "key_block" {
#   depends_on = [module.rg_block]
#   source     = "../../modules/keyvault"
#   keyvault   = var.key_vault
# }



