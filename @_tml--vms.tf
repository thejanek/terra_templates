locals {

  templates_of_vms = {
    web_vm = {
      resource_group_name           = "default" 
      vm_app_type                   = "web"     
      location                      = "default" 
      vm_size                       = "Standard_D4s_v5"
      vm_os_publisher               = "MicrosoftWindowsServer"
      vm_os_offer                   = "WindowsServer"
      vm_os_sku                     = "2016-Datacenter"
      vm_os_version                 = "latest"
      vm_os_simple                  = "Windows2016DC"
      storage_account_type          = "Premium_LRS"
      os_disk_size                  = 128
      admin_username                = "adminuser"
      enable_accelerated_networking = true
      vnet_subnet_id                = "web_subnet" 
      domain_join_enable            = false
      zone                          = "1"
      environment_type              = "default"     
    }
    database_vm = {
      resource_group_name           = "default"  
      vm_app_type                   = "dbs" #"database" 
      location                      = "default"  
      vm_size                       = "Standard_D32s_v5"
      vm_os_publisher               = "MicrosoftWindowsServer"
      vm_os_offer                   = "WindowsServer"
      vm_os_sku                     = "2016-Datacenter"
      vm_os_version                 = "latest"
      vm_os_simple                  = "Windows2016DC"
      storage_account_type          = "Premium_LRS"
      os_disk_size                  = 2048
      admin_username                = "adminuser"
      enable_accelerated_networking = true
      vnet_subnet_id                = "database_subnet" 
      domain_join_enable            = false
      zone                          = "1"
      environment_type              = "default"     
    }
    app_vm = {
      resource_group_name           = "default" 
      vm_app_type                   = "app"     
      location                      = "default" 
      vm_size                       = "Standard_D2as_v4"
      vm_os_publisher               = "Canonical"
      vm_os_offer                   = "UbuntuServer"
      vm_os_sku                     = "18.04-LTS"
      vm_os_version                 = "latest"
      vm_os_simple                  = "UbuntuServer"
      storage_account_type          = "Standard_LRS"
      os_disk_size                  = 512
      admin_username                = "adminuser"
      enable_accelerated_networking = true
      vnet_subnet_id                = "app_subnet" 
      domain_join_enable            = false
      zone                          = "1"
      environment_type              = "default"     
    }
  }

}
