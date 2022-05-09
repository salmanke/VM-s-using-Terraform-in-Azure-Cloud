output "azure_load_balancer_ip_id" {
  value = azurerm_public_ip.azure_load_balancer_IP.id
}

output "azure_backend_pool_id" {
  value = azurerm_lb_backend_address_pool.backend_pool.id
}

output "azure_load_balancer_id" {
  value = azurerm_lb.azure_load_balancer.id
}

output "lb_name" {
  value = azurerm_lb.azure_load_balancer.name
}

output "lb_backend_address_pool_name" {
  value = azurerm_lb_backend_address_pool.backend_pool.name
}