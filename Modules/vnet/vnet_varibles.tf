variable "rg_name" {
  description = "The name of the resource group we want to use"
  type = string
  
}

variable "location" {
  description = "The location/region where we are creating the resource"
  type = string
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  type = string
 
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  
}

