rgs = {
  rg = {
    rg_name     = "dev_infra_rg"
    rg_location = "east asia"
  }
}
vnets = {
  vnet = {
    vnet_name     = "infra_vnet"
    rg_name       = "dev_infra_rg"
    vnet_location = "east asia"
    address_space = ["10.0.0.0/16"]
    dns_servers   = ["10.0.0.4", "10.0.0.5"]
  }
}
snets = {
  snet = {
    snet_name        = "infra_frontend_snet"
    rg_name          = "dev_infra_rg"
    vnet_name        = "infra_vnet"
    address_prefixes = ["10.0.1.0/24"]
  }
  snet1 = {
    snet_name        = "infra_backend_snet"
    rg_name          = "dev_infra_rg"
    vnet_name        = "infra_vnet"
    address_prefixes = ["10.0.2.0/24"]
  }
  snet2 = {
    snet_name        = "infra_database_snet"
    rg_name          = "dev_infra_rg"
    vnet_name        = "infra_vnet"
    address_prefixes = ["10.0.3.0/24"]
  }
}
pips = {
  pip = {
    pip_name          = "infra_frontent_ip"
    rg_name           = "dev_infra_rg"
    pip_location      = "east asia"
    allocation_method = "Static"
  }
  pip1 = {
    pip_name          = "infra_backend_ip"
    rg_name           = "dev_infra_rg"
    pip_location      = "east asia"
    allocation_method = "Static"
  }
}

nics = {
  nic = {
    nic_name     = "frontend_nic"
    nic_location = "east asia"
    rg_name      = "dev_infra_rg"
    snet_name    = "infra_frontend_snet"
    vnet_name    = "infra_vnet"
    pip_name     = "infra_frontent_ip"

  }
  nic1 = {
    nic_name     = "backend_nic"
    nic_location = "east asia"
    rg_name      = "dev_infra_rg"
    snet_name    = "infra_backend_snet"
    vnet_name    = "infra_vnet"
    pip_name     = "infra_backend_ip"
  }
}

vms = {
  vm = {
    vm_name     = "frontendvm"
    rg_name     = "dev_infra_rg"
    vm_location = "east asia"
    # nickey      = "nic"
    nic_name = "frontend_nic"
    # rg_name  = "dev_infra_rg"
    vm_size = "Standard_B2ls_v2"
  }
  vm1 = {
    vm_name     = "backendvm"
    rg_name     = "dev_infra_rg"
    vm_location = "east asia"
    # nickey      = "nic1"
    nic_name = "backend_nic"
    # rg_name  = "dev_infra_rg"
    vm_size = "Standard_B2ls_v2"
  }
}
servers = {
  server = {
    server_name     = "todoappserver-dev-001"
    rg_name         = "dev_infra_rg"
    server_location = "east asia"
  }
}
dbs = {
  db = {
    db_name     = "100_db"
    rg_name     = "dev_infra_rg"
    server_name = "todoappserver-dev-001"
  }
}

nsg = {
  nsg1 = {
    nsg_name     = "prtSecurityGroup1"
    nsg_location = "east asia"
    rg_name      = "dev_infra_rg"
  }
}

# key_vault = {
#   keyvault = {
#     keyvault_name     = "imp-kv-dev-001"
#     keyvault_location = "east asia"
#     rg_name           = "dev_infra_rg"
#   }
# }