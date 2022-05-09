### Resource Group ###
variable "rg_name" {
    type = string
  
}

variable "location" {
    type = string 
  
}

### VNet ####
variable "address_space" {
  
}
variable "vnet_name" {
  
}

### Subnet ###
variable "subnet_prefixes" {
    type = list(string)
  
}

variable "subnet_names" {
    type = list(string)
  
}

#### NSG ###
variable "network_security_group_name" {
  description = "The Network Security Group name to associate with the subnets"
  type        = string
  
}

variable "inbound_port_ranges" {
  default = []
  
}

variable "priority" {
  default = []
  
}

####  Public IP ####
variable "public_ip_name" {
}

variable "public_ip_sku" {
}

variable "public_ip_allocation_method" {
}

#####  Load Balancer ###
variable "lb_name" {
}

variable "lb_sku_name" {
}

variable "lb_frontend_ip_configuration_name" { 
}

variable "lb_backend_address_pool_name" {
}

### NIC ####
# variable "node_count" {
# }

variable "nic_ip_configuration_name" {
}

variable "subnet_ids" {
  type = list(string)
  default = []
}

variable "nic_private_ip_address_allocation" {
}

variable "vm_delete_os_disk_on_termination" {
}

variable "vm_delete_data_disks_on_termination" {
}

variable "vm_size" {
}

variable "vm_storage_os_disk_caching" {
}

variable "vm_storage_os_disk_create_option" {
}

variable "vm_storage_os_disk_managed_disk_type" {  
}

variable "vm_storage_image_reference_publisher" {
  
}

variable "vm_storage_image_reference_offer" {
  
}

variable "vm_storage_image_reference_sku" {
  
}

variable "vm_storage_image_reference_version" {
  
}

variable "vm_computer_name" {
  
}

variable "vm_admin_username" {
  
}

variable "vm_admin_password" {
  
}

variable "vm_disable_password_authentication" {
  
}

variable "nic_backend_address_pool_id" {
  default = []
  
}
variable "nic_names" {
  type = list(string)
  
}
variable "vm_names" {
  #type = list(string)
  
}
# variable "OS_names" {
#   default = []
  
# }