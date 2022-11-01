variable "databases" {
  type = object({
    collation = optional(string)
    charset   = optional(string)
  })
  default     = {}
  description = "Dictionary of databases"
}

variable "server_version" {
  description = "Specifies the version of PostgreSQL to use."
  type        = number
  default     = 14
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the PostgreSQL Server. Changing this forces a new resource to be created."
}

variable "name" {
  type        = string
  description = "Specifies the name of the PostgreSQL Server. Changing this forces a new resource to be created."
}

variable "delegated_subnet_id" {
  type        = string
  default     = null
  description = "Delegated subnet ID"
}

variable "private_dns_zone_id" {
  type        = string
  default     = null
  description = "Private DNS zone ID"
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "administrator_login" {
  description = "The Administrator Login for the PostgreSQL Server. Changing this forces a new resource to be created."
  default     = "pgadm"
  type        = string
}

variable "administrator_password" {
  type        = string
  description = "The Password associated with the administrator_login for the PostgreSQL Server."
}

variable "sku_name" {
  description = "Specifies the SKU Name for this PostgreSQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)."
  type        = string
  default     = "GP_Standard_D2ds_v4"
}

variable "storage_mb" {
  description = "Max storage allowed for a server. Possible values are between 32768 MB(32GB) and 16777216 MB(16TB)."
  default     = 32768
}

variable "zones" {
  description = "Specifies the Availability Zone in which the PostgreSQL Flexible Server should be located."
  default     = null
}

variable "tags" {
  type        = string
  description = "A mapping of tags which should be assigned to the PostgreSQL Flexible Server."
  default     = null
}

variable "high_availability" {
  type = object({
    mode                      = optional(string)
    standby_availability_zone = optional(string)
  })
  default     = null
  description = "mode - (Required) The high availability mode for the PostgreSQL Flexible Server. The only possible value is ZoneRedundant. standby_availability_zone - (Optional) Specifies the Availability Zone in which the standby Flexible Server should be located."
}

variable "maintenance_window" {
  type = object({
    day_of_week  = optional(string)
    start_hour   = optional(string)
    start_minute = optional(string)
  })
  default     = null
  description = "day_of_week - (Optional) The day of week for maintenance window, where the week starts on a Sunday, i.e. Sunday = 0, Monday = 1. Defaults to 0. start_hour - (Optional) The start hour for maintenance window. Defaults to 0. start_minute - (Optional) The start minute for maintenance window. Defaults to 0."
}

variable "geo_redundant_backup_enabled" {
  type        = bool
  default     = false
  description = "geo_redundant_backup_enabled - (Optional) Is Geo-Redundant backup enabled on the PostgreSQL Flexible Server. Defaults to false. Changing this forces a new PostgreSQL Flexible Server to be created."
}

variable "backup_retention_days" {
  type        = number
  default     = 30
  description = "- (Optional) The backup retention days for the PostgreSQL Flexible Server. Possible values are between 7 and 35 days."
}

variable "firewall_rules" {
  type        = map(list(string))
  default     = {}
  description = "Manages a PostgreSQL Flexible Server Firewall Rule."
}

variable "server_config" {
  type        = map(string)
  default     = {}
  description = "Sets a PostgreSQL Configuration value on a Azure PostgreSQL Flexible Server."
}



