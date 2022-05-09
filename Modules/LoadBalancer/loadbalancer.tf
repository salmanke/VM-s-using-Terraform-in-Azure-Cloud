############## load balancer section  ##############
#### Create public IP for LB  ####
resource "azurerm_public_ip" "azure_load_balancer_IP" {
  name                = var.public_ip_name
  location            = var.location  
  resource_group_name = var.rg_name
  sku                 = var.public_ip_sku    
  allocation_method   = var.public_ip_allocation_method                     
}

##### Create the LB ####
resource "azurerm_lb" "azure_load_balancer" {
  name                = var.lb_name   
  location            = azurerm_public_ip.azure_load_balancer_IP.location   
  resource_group_name = azurerm_public_ip.azure_load_balancer_IP.resource_group_name
  sku                 = var.lb_sku_name  
  
  frontend_ip_configuration {
    name                 = var.lb_frontend_ip_configuration_name   
    public_ip_address_id = azurerm_public_ip.azure_load_balancer_IP.id
  }
  depends_on = [azurerm_public_ip.azure_load_balancer_IP]
}

#### Create backend pool ####
resource "azurerm_lb_backend_address_pool"  "backend_pool" {
  resource_group_name = azurerm_lb.azure_load_balancer.resource_group_name
  name                = var.lb_backend_address_pool_name  
  loadbalancer_id     = azurerm_lb.azure_load_balancer.id
  depends_on = [azurerm_lb.azure_load_balancer]
  
}

#### Create NAT pool ####
resource "azurerm_lb_rule" "azure_lb_rule" {
  resource_group_name            = azurerm_lb_backend_address_pool.backend_pool.resource_group_name
  loadbalancer_id                = azurerm_lb.azure_load_balancer.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = var.lb_frontend_ip_configuration_name

  depends_on = [azurerm_lb_backend_address_pool.backend_pool]
}

