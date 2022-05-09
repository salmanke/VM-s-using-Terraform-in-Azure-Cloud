### NIC  ###
resource "azurerm_network_interface" "nics" {
  count                     = length( var.nic_names) > 0 ? length(var.nic_names) : 0
  name                      = element(var.nic_names, count.index)
  location                  = var.location
  resource_group_name       = var.rg_name
    
  ip_configuration {
    name                           = var.nic_ip_configuration_name
    subnet_id                      = element(var.subnet_ids, count.index)   
    private_ip_address_allocation  = var.nic_private_ip_address_allocation 

  }

}

### VMs  ####
resource "azurerm_virtual_machine" "node" {
  count                 = length( var.vm_names) > 0 ? length(var.vm_names) : 0
  name                  = element(var.vm_names, count.index)
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [element(azurerm_network_interface.nics.*.id, count.index)]

  # Uncomment this line to delete the OS disk automatically when deleting the VM
   delete_os_disk_on_termination = var.vm_delete_os_disk_on_termination    

  # Uncomment this line to delete the data disks automatically when deleting the VM
   delete_data_disks_on_termination = var.vm_delete_data_disks_on_termination    

  
  vm_size = var.vm_size 

  # OS disk
  storage_os_disk {
    name              = element(var.vm_names, count.index)
    caching           = var.vm_storage_os_disk_caching   
    create_option     = var.vm_storage_os_disk_create_option   
    managed_disk_type = var.vm_storage_os_disk_managed_disk_type   
  }

  # Image reference
  storage_image_reference {
    publisher = var.vm_storage_image_reference_publisher   
    offer     = var.vm_storage_image_reference_offer       
    sku       = var.vm_storage_image_reference_sku         
    version   = var.vm_storage_image_reference_version     
  }

  os_profile {
        computer_name  = var.vm_computer_name   
        admin_username = var.vm_admin_username  
        admin_password = var.vm_admin_password  
    }

  os_profile_linux_config {
        disable_password_authentication = var.vm_disable_password_authentication  
    }
}

####  Attaching the VM's to LB's backend pool  ####
resource "azurerm_network_interface_backend_address_pool_association" "vault" {
  count                  = length( var.vm_names) > 0 ? length(var.vm_names) : 0
  network_interface_id    = element(azurerm_network_interface.nics.*.id, count.index)
  ip_configuration_name   = var.nic_ip_configuration_name
  backend_address_pool_id = var.nic_backend_address_pool_id  
}


  