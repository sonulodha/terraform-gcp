resource  "google_sql_database_instance" "mysql-database" {
    name                    = var.mysql_vm_name
    database_version        = var.mysql_verion
    deletion_protection     = var.mysql_deletion_protection

    settings {
        tier                = var.mysql_vm_tier
        disk_type           = var.mysql_vm_disk_type
        disk_size           = var.mysql_vm_disk_size
        disk_autoresize     = var.mysql_vm_disk_autoresize
        availability_type   = var.mysql_vm_availability_type
    
        backup_configuration {
            binary_log_enabled              = var.mysql_binary_log_enabled
            enabled                         = var.mysql_backup_enabled
            start_time                      = var.mysql_backup_time
            location                        = var.mysql_backup_location
            transaction_log_retention_days  = var.mysql_transaction_log_retention_days
        
            backup_retention_settings {
                    retained_backups        = var.mysql_retained_backups
                }
        } 

            ip_configuration {
                ipv4_enabled       = var.mysql_public_network
                private_network    = var.mysql_private_network
            }
    }
    timeouts {
        create = "60m"
        delete = "60m"
    }

}
