
variable "rg_name" {
  description = "The name of the resource group we want to use"
  type = string
  
}

variable "location" {
  description = "The location/region where we are crrating the resource"
  type = string
}

#### NIC  and VM ###
variable "nic_ip_configuration_name" {
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

variable "subnet_ids" {
    type = list(string)
  
}

variable "nic_names" {
  type = list(string)
  
}

variable "vm_names" {
  type = list(string)
  
}
