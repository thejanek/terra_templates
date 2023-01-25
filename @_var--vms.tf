locals {

  vms = {

    # --------------------------------------------------------------------------
    # EXAMPLE AND DESCRIPTIO OF USING THE FULL "DEFAULT" TEMPLTE:

    # prod = {

    #   prod_web_01 = { template = "web_vm" }

    #   prod_web_02 = { 
    #     template = "web_vm"
    #     resource_group_name           = "default" / "the name of any existing resource group"
    #     vm_app_type                   = "web" / "app" / "dbs"
    #     location                      = "default" / "the name of any Azure region"
    #     vm_size                       = "Standard_D4s_v5" / "any available VM size"
    #     vm_os_publisher               = "MicrosoftWindowsServer" / "Canonical"
    #     vm_os_offer                   = "WindowsServer" / "UbuntuServer" / "..."
    #     vm_os_sku                     = "2016-Datacenter" / "18.04-LTS" / "..."
    #     vm_os_version                 = "latest" / "..."
    #     vm_os_simple                  = "Windows2016DC" / "UbuntuServer"
    #     storage_account_type          = "Standard_LRS" / "StandardSSD_LRS" / "Premium_LRS" / "StandardSSD_ZRS" / "Premium_ZRS"
    #     os_disk_size                  = 128 / ...
    #     admin_username                = "adminuser" / "any other name of local admin except admin or administrator"
    #     enable_accelerated_networking = true / false
    #     vnet_subnet_id                = "ad_subnet" / "agent_subnet" /  "app_subnet" / "database_subnet" / "ftp_subnet" / "web_subnet" 
    #     domain_join_enable            = false / true
    #     zone                          = "1" / "2" / "3"
    #     environment_type              = "default" / "prod" / "qa" / "test" 

    #   }
    # }

    # qa   = {}

    # test = {}

    # --------------------------------------------------------------------------


    prod = {
      prod_web_01 = { template = "web_vm" }
      prod_web_01 = { template = "web_vm" }
    }
    qa = {
      qa_web_01 = { template = "web_vm" }
      qa_db_01  = { template = "database_vm" }
      qa_app_01 = { template = "app_vm" }
    }
    test = {
      test_app_01 = { template = "app_vm" }
      test_app_02 = { template = "app_vm" }       
    }
  }

}






#       # --------------------------------------------
#       # App VMs
#       test_app_02 = { template = "app_vm" }
#       test_app_03 = { template = "app_vm" }
#       # --------------------------------------------
#       # Web VMs
#       test_web_01 = { template = "web_vm" }
#       test_web_02 = { template = "web_vm" }
#       test_web_03 = { template = "web_vm" }
#       # --------------------------------------------
#       # Database VMs
#       test_db_01  = { template = "database_vm" }
#       test_db_02  = { template = "database_vm" }
#       test_db_03  = { template = "database_vm" }
#       test_db_04  = { template = "database_vm" }
#       test_db_05 = { template = "database_vm" }
#       test_db_06 = { template = "database_vm" }
#       test_db_07 = { template = "database_vm" }
#       test_db_08 = {
#         template = "database_vm"
#         vm_size  = "Standard_D99_v5"
#       }
#       # --------------------------------------------
#       # Specific VMs
#       spiderman = { template = "web_vm" }
#       spiderman2 = { template = "web_vm" }  