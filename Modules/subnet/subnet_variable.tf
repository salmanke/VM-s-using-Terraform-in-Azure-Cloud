variable "rg_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "subnet_prefixes" {
  type        = list(string)
  default     = []
}

variable "subnet_names" {
  type        = list(string)
  default     = []
}


