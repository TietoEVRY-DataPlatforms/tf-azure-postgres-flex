locals {
  default_charset   = "UTF8"
  default_collation = "English_United States.1252"
}

resource "azurerm_postgresql_flexible_server" "postgresql_server" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  version                = var.server_version
  storage_mb             = var.storage_mb
  sku_name               = var.sku_name
  zone                   = var.zones

  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled


  delegated_subnet_id = var.delegated_subnet_id
  private_dns_zone_id = var.private_dns_zone_id


  tags = var.tags
  dynamic "high_availability" {
    for_each = var.high_availability != null ? [1] : []
    content {
      mode                      = var.high_availability.mode
      standby_availability_zone = var.high_availability.standby_availability_zone
    }
  }
  dynamic "maintenance_window" {
    for_each = var.maintenance_window != null ? [1] : []
    content {
      day_of_week  = var.maintenance_window.day_of_week
      start_hour   = var.maintenance_window.start_hour
      start_minute = var.maintenance_window.start_minute
    }
  }
  # depends_on = [azurerm_postgresql_flexible_server.example]
}

resource "azurerm_postgresql_flexible_server_database" "database" {
  for_each  = var.databases
  name      = each.key
  server_id = azurerm_postgresql_flexible_server.postgresql_server.id
  collation = lookup(each.value, "collation", local.default_collation)
  charset   = lookup(each.value, "charset", local.default_charset)
}

resource "azurerm_postgresql_flexible_server_configuration" "server_config" {
  for_each  = var.server_config
  name      = each.key
  server_id = azurerm_postgresql_flexible_server.postgresql_server.id
  value     = each.value
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "firewall_rules" {
  for_each         = var.firewall_rules
  name             = each.key
  server_id        = azurerm_postgresql_flexible_server.postgresql_server.id
  start_ip_address = each.value[0]
  end_ip_address   = each.value[1]
}


