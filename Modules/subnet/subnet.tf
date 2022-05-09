resource "azurerm_subnet" "subnet" {
  count                  = length( var.subnet_prefixes) > 0 ? length(var.subnet_prefixes) : 0
  name                   = element(var.subnet_names, count.index)
  virtual_network_name   = var.vnet_name
  resource_group_name    = var.rg_name
  address_prefix         = element(var.subnet_prefixes, count.index)
   
} 
