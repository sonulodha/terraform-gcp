resource  "google_sql_database_instance" "pgsql" {
    name                    = var.pgsql_vm_name
    database_version        = var.pgsql_database_version
    deletion_protection     = var.pgsql_deletion_protection
    settings {
        tier                = var.pgsql_vm_tier
        disk_type           = var.pgsql_vm_disk_type
        disk_size           = var.pgsql_vm_disk_size
        disk_autoresize     = var.pgsql_vm_disk_autoresize
        availability_type   = var.pgsql_vm_availability_type
        backup_configuration {
            enabled                         = var.pgsql_backup_enabled
            point_in_time_recovery_enabled  = var.pgsql_point_in_time_recovery_enabled 
            start_time                      = var.pgsql_backup_time
            location                        = var.pgsql_backup_location
            transaction_log_retention_days  = var.pgsql_transaction_log_retention_days
            backup_retention_settings {
                    retained_backups        = var.pgsql_retained_backups
                }
        } 
            ip_configuration {
                ipv4_enabled       = var.pgsql_public_network
                private_network    = var.pgsql_private_network
            }
    }
    timeouts {
        create = "60m"
        delete = "60m"
  }
}
