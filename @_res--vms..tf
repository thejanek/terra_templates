module "vms" {
  source   = "git@ssh.dev.azure.com:v3/CloudTeam-Public/terraform-modules/tf-az-module-windows-vm-creation?ref=v2.8.0"
  for_each = local.appropriate_object_of_vms

  resource_group_name           = each.value.resource_group_name
  vm_app_type                   = each.value.vm_app_type
  location                      = each.value.location
  vm_size                       = each.value.vm_size
  vm_os_publisher               = each.value.vm_os_publisher
  vm_os_offer                   = each.value.vm_os_offer
  vm_os_sku                     = each.value.vm_os_sku
  vm_os_version                 = each.value.vm_os_version
  vm_os_simple                  = each.value.vm_os_simple
  storage_account_type          = each.value.storage_account_type
  os_disk_size                  = each.value.os_disk_size
  admin_username                = each.value.admin_username
  enable_accelerated_networking = each.value.enable_accelerated_networking
  vnet_subnet_id                = each.value.vnet_subnet_id
  domain_join_enable            = each.value.domain_join_enable
  zone                          = each.value.zone
  environment                   = each.value.environment_type
}
