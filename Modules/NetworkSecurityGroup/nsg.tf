resource "azurerm_network_security_group" "nsg"{
    name                   = var.network_security_group_name
    resource_group_name    = var.rg_name
    location               = var.location
    
}   

resource "azurerm_network_security_rule" "nsg" {
  count                       = length( var.inbound_port_ranges) > 0 ? length(var.inbound_port_ranges) : 0
  name                        = "Port_${element(var.inbound_port_ranges, count.index)}"
  direction                   = "Inbound"
  access                      = "Allow"
  priority                    = element(var.priority, count.index)
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = element(var.inbound_port_ranges, count.index)
  protocol                    = "TCP"
  resource_group_name         = azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  depends_on = [azurerm_network_security_group.nsg]
}


