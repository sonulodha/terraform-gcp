module  "network" {
  source                                = "./modules/network"
  vpc_name                              = "${format("%s","${var.client_name}-${var.envtype}-${var.vpc_name}")}"
  auto_create_subnet                    = var.auto_create_subnet
  routing_mode                          = var.routing_mode
  subnet_name                           = "${format("%s","${var.client_name}-${var.envtype}-${var.subnet_name}")}"
  ip_cidr_range                         = var.ip_cidr_range
  subnet_region                         = var.subnet_region
  stack_type                            = var.stack_type
  private_ip_google_access              = var.private_ip_google_access
  router_name                           = "${format("%s","${var.client_name}-${var.envtype}-${var.router_name}")}"
  nat_name                              = "${format("%s","${var.client_name}-${var.envtype}-${var.nat_name}")}"
  internal_fwrule_name                  = "${format("%s","${var.client_name}-${var.envtype}-${var.internal_fwrule_name}")}"
  ssh_fwrule_name                       = "${format("%s","${var.client_name}-${var.envtype}-${var.ssh_fwrule_name}")}"
  private_service_iprange_name          = "${format("%s","${var.client_name}-${var.envtype}-${var.private_service_iprange_name}")}"
}

module "pubsub" {
  source = "./modules/pubusb"
  pubsub_topic_name                     = "${format("%s","${var.client_name}-${var.envtype}-${var.pubsub_topic_name}")}"
  pubsub_subscription_name              = "${format("%s","${var.client_name}-${var.envtype}-${var.pubsub_subscription_name}")}"
  ack_deadline_seconds                  = var.ack_deadline_seconds
  retain_acked_messages                 = var.retain_acked_messages
}

module "redis" {
  source                                = "./modules/redis"
  depends_on                            = [module.network]
  redis_vm_name                         = "${format("%s","${var.client_name}-${var.envtype}-${var.redis_vm_name}")}"
  redis_vm_tier                         = var.redis_vm_tier
  redis_vm_memory_size_gb               = var.redis_vm_memory_size_gb
  redis_vm_version                      = var.redis_vm_version
  redis_vm_read_replicas_mode           = var.redis_vm_read_replicas_mode 
  redis_vm_reserved_ip_range            = "${format("%s","${var.client_name}-${var.envtype}-${var.private_service_iprange_name}")}"
  redis_vm_auth_enabled                 = var.redis_vm_auth_enabled
  redis_vm_authorized_network           = "${format("%s","projects/iteindia-playground/global/networks/${var.client_name}-${var.envtype}-${var.vpc_name}")}"
  redis_vm_transit_encryption_mode      = var.redis_vm_transit_encryption_mode
  redis_vm_connect_mode                 = var.redis_vm_connect_mode
  redis_vm_labels 	                    = var.redis_vm_labels
}

module "mysql" {
  source                                = "./modules/cloudsql/mysql"
  depends_on                            = [module.network]
  mysql_vm_name                         = "${format("%s","${var.client_name}-${var.envtype}-${var.mysql_vm_name}")}"
  mysql_verion                          = var.mysql_verion
  mysql_vm_tier                         = var.mysql_vm_tier
  mysql_vm_disk_type                    = var.mysql_vm_disk_type
  mysql_vm_disk_size                    = var.mysql_vm_disk_size
  mysql_vm_disk_autoresize              = var.mysql_vm_disk_autoresize
  mysql_vm_availability_type            = var.mysql_vm_availability_type
  mysql_binary_log_enabled              = var.mysql_binary_log_enabled
  mysql_backup_enabled                  = var.mysql_backup_enabled
  mysql_backup_time                     = var.mysql_backup_time
  mysql_transaction_log_retention_days  = var.mysql_transaction_log_retention_days
  mysql_retained_backups                = var.mysql_retained_backups
  mysql_backup_location                 = var.mysql_backup_location
  mysql_point_in_time_recovery_enabled  = var.mysql_point_in_time_recovery_enabled
  mysql_deletion_protection             = var.mysql_deletion_protection
  mysql_public_network                  = var.mysql_public_network
  mysql_private_network                 = "${format("%s","projects/iteindia-playground/global/networks/${var.client_name}-${var.envtype}-${var.vpc_name}")}"

}

module "pgsql" {
  source                                = "./modules/cloudsql/pgsql"
  depends_on                            = [module.network]
  pgsql_vm_name                         = "${format("%s","${var.client_name}-${var.envtype}-${var.pgsql_vm_name}")}"
  pgsql_database_version                = var.pgsql_database_version
  pgsql_vm_tier                         = var.pgsql_vm_tier
  pgsql_vm_disk_type                    = var.pgsql_vm_disk_type
  pgsql_vm_disk_size                    = var.pgsql_vm_disk_size
  pgsql_vm_disk_autoresize              = var.pgsql_vm_disk_autoresize
  pgsql_vm_availability_type            = var.pgsql_vm_availability_type
  pgsql_backup_enabled                  = var.pgsql_backup_enabled
  pgsql_point_in_time_recovery_enabled  = var.pgsql_point_in_time_recovery_enabled
  pgsql_backup_time                     = var.pgsql_backup_time
  pgsql_backup_location                 = var.pgsql_backup_location
  pgsql_transaction_log_retention_days  = var.pgsql_transaction_log_retention_days
  pgsql_retained_backups                = var.pgsql_retained_backups
  pgsql_public_network                  = var.pgsql_public_network
  pgsql_private_network                 = "${format("%s","projects/iteindia-playground/global/networks/${var.client_name}-${var.envtype}-${var.vpc_name}")}"
  pgsql_deletion_protection             = var.pgsql_deletion_protection
}

module "bucket" {
  source                                = "./modules/bucket"
  bucket_name                              = "${format("%s","${var.client_name}-${var.envtype}-${var.bucket_name}")}"
  bucket_location                       = "asia-south1"
  bucket_uniform_level_access           = false
  bucket_origin_list                    = ["*"]
  bucket_method                         = ["GET"]
  bucket_reponse_header                 = ["Content-Type"]
  bucket_max_age_seconds                = "3600"
  bucket_role                           = "READER"
  bucket_entity                         = "allUsers"
}
