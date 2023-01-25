locals {

  #---------------------------------------------------------------------------------------------------
  # Azure Storage Sync Service

  reference_object_of_all_vms = { for k1, v1 in local.vms[lower(var.environment_type)] :
    k1 => {
      template = try(v1.template, keys(local.templates_of_vms[v1.template]))

      resource_group_name           = try(v1.resource_group_name, local.templates_of_vms[v1.template].resource_group_name)
      vm_app_type                   = try(v1.vm_app_type, local.templates_of_vms[v1.template].vm_app_type)
      location                      = try(v1.location, local.templates_of_vms[v1.template].location)
      vm_size                       = try(v1.vm_size, local.templates_of_vms[v1.template].vm_size)
      vm_os_publisher               = try(v1.vm_os_publisher, local.templates_of_vms[v1.template].vm_os_publisher)
      vm_os_offer                   = try(v1.vm_os_offer, local.templates_of_vms[v1.template].vm_os_offer)
      vm_os_sku                     = try(v1.vm_os_sku, local.templates_of_vms[v1.template].vm_os_sku)
      vm_os_version                 = try(v1.vm_os_version, local.templates_of_vms[v1.template].vm_os_version)
      vm_os_simple                  = try(v1.vm_os_simple, local.templates_of_vms[v1.template].vm_os_simple)
      storage_account_type          = try(v1.storage_account_type, local.templates_of_vms[v1.template].storage_account_type)
      os_disk_size                  = try(v1.os_disk_size, local.templates_of_vms[v1.template].os_disk_size)
      admin_username                = try(v1.admin_username, local.templates_of_vms[v1.template].admin_username)
      enable_accelerated_networking = try(v1.enable_accelerated_networking, local.templates_of_vms[v1.template].enable_accelerated_networking)
      vnet_subnet_id                = try(v1.vnet_subnet_id, local.templates_of_vms[v1.template].vnet_subnet_id)
      domain_join_enable            = try(v1.domain_join_enable, local.templates_of_vms[v1.template].domain_join_enable)
      zone                          = try(v1.zone, local.templates_of_vms[v1.template].zone)
      environment_type              = try(v1.environment_type, local.templates_of_vms[v1.template].environment_type)
    }
  }


  # For module "vms"
  appropriate_object_of_vms = { for k1, v1 in local.reference_object_of_all_vms :
    k1 => {
      resource_group_name           = v1.resource_group_name == "default" ? local.rg_name : "rg-test-0001"
      vm_app_type                   = v1.vm_app_type
      location                      = v1.location == "default" ? var.location : "uscentral"
      vm_size                       = v1.vm_size
      vm_os_publisher               = v1.vm_os_publisher
      vm_os_offer                   = v1.vm_os_offer
      vm_os_sku                     = v1.vm_os_sku
      vm_os_version                 = v1.vm_os_version
      vm_os_simple                  = v1.vm_os_simple
      storage_account_type          = v1.storage_account_type
      os_disk_size                  = v1.os_disk_size
      admin_username                = v1.admin_username
      enable_accelerated_networking = v1.enable_accelerated_networking
      vnet_subnet_id                = local.map_of_all_subnets_id[v1.vnet_subnet_id]
      domain_join_enable            = v1.domain_join_enable
      zone                          = v1.zone
      environment_type              = v1.environment_type == "default" ? [lower(var.environment_type)][0] : null
    }
  }

  # azurerm_subnet.dedicated-subnets-creation[v1.vnet_subnet_id].id
  # azurerm_subnet.dedicated-subnets-creation["web"].id

  map_of_all_subnets_id = {
    "ad_subnet"       = azurerm_subnet.dedicated-subnets-creation["ad"].id
    "agent_subnet"    = azurerm_subnet.dedicated-subnets-creation["agent"].id
    "app_subnet"      = azurerm_subnet.dedicated-subnets-creation["app"].id
    "database_subnet" = azurerm_subnet.dedicated-subnets-creation["database"].id
    "ftp_subnet"      = azurerm_subnet.dedicated-subnets-creation["ftp"].id
    "web_subnet"      = azurerm_subnet.dedicated-subnets-creation["web"].id
  }












}
