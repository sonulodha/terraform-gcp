variable    "mysql_vm_name" {
    type    = string
    default = "sqlmysql"
}
variable    "mysql_verion"{
    type    = string
    default = "MYSQL_8_0"
}
variable    "mysql_vm_tier"{
    type    = string
    default = "db-f1-micro"
}
variable    "mysql_vm_disk_type"{
    type    = string
    default = "PD_SSD"
}
variable    "mysql_vm_disk_size"{
    type    = string
    default = "10"
}
variable    "mysql_vm_disk_autoresize" {
    type = bool
    default = true
}
variable    "mysql_vm_availability_type" {
    type    = string
    default = "ZONAL"   
}

variable    "mysql_binary_log_enabled" {
    type    = bool
    default = true
}

variable    "mysql_backup_enabled" {
    type    = bool
    default = true
}

variable    "mysql_backup_time" {
    type    = string
    default = "13:30"
}

variable    "mysql_backup_location" {
    type    = string
    default = "asia-south1"
}

variable    "mysql_point_in_time_recovery_enabled" {
    type    = bool
    default = true
}

variable    "mysql_transaction_log_retention_days" {
    type    = number
    default = 7
}

variable    "mysql_deletion_protection" {
    type    = bool
    default = false
}
variable    "mysql_retained_backups" {
    type    = number
    default = 7
}
variable    "mysql_private_network" {
    type    = string
}
variable    "mysql_public_network" {
    type    = string
    default = true
}