variable "redis_vm_name" {
    type        = string
    default     = "redis"
}

variable "redis_vm_tier" {
    type        = string
    default     = "STANDARD_HA"
}

variable "redis_vm_memory_size_gb" {
    type        = number
    default     = 1
}

variable "redis_vm_version" {
    type        = string
    default     = "REDIS_5_0"
}

variable "redis_vm_read_replicas_mode" {
    type        = string
    default     = "READ_REPLICAS_DISABLED"
}

variable "redis_vm_auth_enabled" {
    type        = bool
    default     = false
}
variable "redis_vm_transit_encryption_mode" {
    type        = string
    default     = "DISABLED"
}
variable "redis_vm_connect_mode" {
    type        = string
    default     = "PRIVATE_SERVICE_ACCESS"
}

variable "redis_vm_labels" {
    type        = map(string)
    default = {
    "class" = "cache"
  }
}
variable "redis_vm_authorized_network" {
    type        = string
    default     = "azure-qa-vpc"
}
variable "redis_vm_reserved_ip_range" {
    type        = string
}
