### Resource Group ####
rg_name             = "cmsxpod-rg-01"
location            = "eastus"

#### Vnet ######
vnet_name           = "cmsxpod-vnet"
address_space       = "10.0.0.0/16"

#####  Subnet ####
subnet_names        = ["subnet01", "subnet02"]
subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]
subnet_ids          = ["/subscriptions/50b687cb-56db-463f-ab44-d392ba7b919c/resourceGroups/cmsxpod-rg-01/providers/Microsoft.Network/virtualNetworks/cmsxpod-vnet/subnets/subnet01", "/subscriptions/50b687cb-56db-463f-ab44-d392ba7b919c/resourceGroups/cmsxpod-rg-01/providers/Microsoft.Network/virtualNetworks/cmsxpod-vnet/subnets/subnet02"]

### NSG ####
network_security_group_name     = "cmsxpod-nsg"
inbound_port_ranges             = [80, 443]
priority                        = [100, 101]

### Public Ip ####
public_ip_name                  =  "CMSPublicIPForLB"
public_ip_sku                   =  "Standard"
public_ip_allocation_method     =  "Static"

### Load Balancer ####
lb_name                           = "cmsxpodLB"
lb_sku_name                       = "Standard"
lb_frontend_ip_configuration_name = "cmsxpodLBFE"
lb_backend_address_pool_name      = "cmsxpodLBBEPool"

### NIC ###
nic_ip_configuration_name         = "cms_host_nic"
nic_private_ip_address_allocation = "Dynamic"
nic_backend_address_pool_id       = "/subscriptions/50b687cb-56db-463f-ab44-d392ba7b919c/resourceGroups/cmsxpod-rg-01/providers/Microsoft.Network/loadBalancers/cmsxpodLB/backendAddressPools/cmsxpodLBBEPool"

####  VM  ###
nic_names                            = ["cmsxpod-nic01", "cmsxpod-nic02"]
vm_names                             = ["cmsxpod-vm01", "cmsxpod-vm02"]
vm_delete_os_disk_on_termination     = true
vm_delete_data_disks_on_termination  = true
vm_size                              = "Standard_B1s"


vm_storage_os_disk_caching           = "ReadWrite"
vm_storage_os_disk_create_option     = "FromImage"
vm_storage_os_disk_managed_disk_type = "Standard_LRS"

vm_storage_image_reference_publisher = "Canonical"
vm_storage_image_reference_offer     = "UbuntuServer"
vm_storage_image_reference_sku       = "18.04-LTS"
vm_storage_image_reference_version   = "latest"

vm_computer_name                     = "Production"
vm_admin_username                    = "azureuser"
vm_admin_password                    = "azureuser@1234"
vm_disable_password_authentication   = false



