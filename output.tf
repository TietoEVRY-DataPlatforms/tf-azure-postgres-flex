output "server_name" {
  description = "The name of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.postgresql_server.name
}

output "server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.postgresql_server.fqdn
}

output "server_id" {
  description = "The resource id of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.postgresql_server.id
}

output "databases" {
  description = "The list of all database resource ids"
  value       = azurerm_postgresql_flexible_server_database.database
}
