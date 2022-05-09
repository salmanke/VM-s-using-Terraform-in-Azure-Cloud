variable "rg_name" {
  description = "The Network Security Group RG to associate with the subnet. Default is the same RG than the subnet."
  type        = string
  
}

variable "location" {
    type = string 
  
}

variable "network_security_group_name" {
  description = "The Network Security Group name to associate with the subnets"
  type        = string
  
}


variable "inbound_port_ranges" {
  default = [80, 443]
  
}

variable "priority" {
  default = [100, 101]
}