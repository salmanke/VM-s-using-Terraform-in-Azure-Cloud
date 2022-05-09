####   Create virtual network   ####
module "application-vnet" {
  source              = "../modules/vnet"
  rg_name             = var.rg_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space

}

####   Create subnet   #####
module "application-subnets" {
  source              = "../Modules/subnet"
  vnet_name           = module.application-vnet.vnet-name
  subnet_prefixes     = var.subnet_prefixes
  subnet_names        = var.subnet_names
  rg_name             = var.rg_name

}   


#### Create Network Security Group and rule ####
module "application-nsg" {
  source                          = "../Modules/NetworkSecurityGroup"
  rg_name                         = var.rg_name
  location                        = var.location
  network_security_group_name     = var.network_security_group_name

}

####  Load Balancer ###
module "application-loadbalancer" {
  source                                = "../Modules/LoadBalancer"
  rg_name                               = var.rg_name
  location                              = var.location
  public_ip_name                        = var.public_ip_name
  public_ip_sku                         = var.public_ip_sku
  public_ip_allocation_method           = var.public_ip_allocation_method
  lb_name                               = var.lb_name
  lb_sku_name                           = var.lb_sku_name
  lb_frontend_ip_configuration_name     = var.lb_frontend_ip_configuration_name
  lb_backend_address_pool_name          = var.lb_backend_address_pool_name
  
}

#### NIC and VM  ####
module "application-virtualmachine" {
  source                                      = "../Modules/VM"
  rg_name                                     = var.rg_name
  location                                    = var.location
  nic_names                                   = var.nic_names
  vm_names                                    = var.vm_names
  subnet_ids                                  = module.application-subnets.subnet_id
  nic_ip_configuration_name                   = var.nic_ip_configuration_name
  nic_private_ip_address_allocation           = var.nic_private_ip_address_allocation
  vm_storage_image_reference_version          = var.vm_storage_image_reference_version
  nic_backend_address_pool_id                 = module.application-loadbalancer.azure_backend_pool_id
  vm_storage_os_disk_create_option            = var.vm_storage_os_disk_create_option
  vm_storage_os_disk_caching                  = var.vm_storage_os_disk_caching
  vm_storage_image_reference_publisher        = var.vm_storage_image_reference_publisher
  vm_storage_image_reference_offer            = var.vm_storage_image_reference_offer
  vm_storage_image_reference_sku              = var.vm_storage_image_reference_sku
  vm_storage_os_disk_managed_disk_type        = var.vm_storage_os_disk_managed_disk_type
  vm_size                                     = var.vm_size
  vm_computer_name                            = var.vm_computer_name
  vm_admin_username                           = var.vm_admin_username
  vm_admin_password                           = var.vm_admin_password
  vm_disable_password_authentication          = var.vm_disable_password_authentication
  vm_delete_os_disk_on_termination            = var.vm_delete_os_disk_on_termination
  vm_delete_data_disks_on_termination         = var.vm_delete_data_disks_on_termination

}