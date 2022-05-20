/******************************************
	CLOUDSQL Postgresql VARIABLES
 *****************************************/

variable    "pgsql_vm_name" {
    type    = string
    default = "pgsqlsql"
}
variable    "pgsql_database_version"{
    type    = string
    default = "POSTGRES_11"
}
variable    "pgsql_vm_tier"{
    type    = string
    default = "db-f1-micro"
}
variable    "pgsql_vm_disk_type"{
    type    = string
    default = "PD_SSD"
}
variable    "pgsql_vm_disk_size"{
    type    = string
    default = "10"
}
variable    "pgsql_vm_disk_autoresize" {
    type = bool
    default = true
}
variable    "pgsql_vm_availability_type" {
    type    = string
    default = "ZONAL"   
}

variable    "binary_log_enabled" {
    type    = bool
    default = false
}

variable    "pgsql_backup_enabled" {
    type    = bool
    default = true
}

variable    "pgsql_backup_time" {
    type    = string
    default = "13:30"
}

variable    "pgsql_backup_location" {
    type    = string
    default = "asia-south1"
}

variable    "pgsql_point_in_time_recovery_enabled" {
    type    = bool
    default = true
}

variable    "pgsql_transaction_log_retention_days" {
    type    = number
    default = 7
}

variable    "pgsql_deletion_protection" {
    type    = bool
    default = false
}
variable    "pgsql_retained_backups" {
    type    = number
    default = 15
}
variable    "pgsql_private_network" {
    type    = string
}

variable    "pgsql_public_network" {
    type    = bool
    default = true
}
