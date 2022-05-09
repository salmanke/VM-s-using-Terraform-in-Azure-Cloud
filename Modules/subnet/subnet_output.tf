output "subnet_id" {
  description = "The ids of subnets created inside the newly created vNet"
  value       = azurerm_subnet.subnet.*.id
}