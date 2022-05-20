resource "google_project_service" "enable_apis" {
        service                         = "redis.googleapis.com"
}

resource "google_redis_instance" "redis" {
  depends_on               = [google_project_service.enable_apis]
  name                      = var.redis_vm_name
  tier                      = var.redis_vm_tier
  memory_size_gb            = var.redis_vm_memory_size_gb
  redis_version             = var.redis_vm_version
  read_replicas_mode        = var.redis_vm_read_replicas_mode
  reserved_ip_range         = var.redis_vm_reserved_ip_range
  auth_enabled              = var.redis_vm_auth_enabled
  authorized_network        = var.redis_vm_authorized_network
  transit_encryption_mode   = var.redis_vm_transit_encryption_mode
  connect_mode              = var.redis_vm_connect_mode
  labels 	            = var.redis_vm_labels
  timeouts {
        create = "60m"
        delete = "60m"
    }
}
