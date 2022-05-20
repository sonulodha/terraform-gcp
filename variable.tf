variable "client_name" {
  description   = "client_name"
  type = string
  default       = "lenovo"
}
variable "envtype" {
  type = string
  description   = "env type"
  default       = "prod"
}

/******************************************
	VPC VARIABLES
 *****************************************/

variable "vpc_name" {
  description   = "The name of the network being created"
  type          = string
  default       = "vpc"
}
variable "routing_mode" {
  type          = string
  description   = "The network routing mode (default 'GLOBAL')"
  default       = "REGIONAL"
}

variable "auto_create_subnet" {
  type          = bool
  description   = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnet resources."
  default       = false
}
/******************************************
	Subnet VARIABLES
 *****************************************/

 variable "subnet_name" {
  description   = "The name of the subnet being created"
  type          =  string 
  default       = "subnet"
}

 variable "ip_cidr_range" {
  description   = "he range of internal addresses that are owned by this subnet. For example, 10.0.0.0/8 or 192.168.0.0/16."
  type          = string  
  default       = "172.17.0.0/24"
}

 variable "subnet_region" {
  description   = "The GCP region for this subnet"
  type          = string 
  default       = "europe-west1"
}

 variable "stack_type" {
  description   = "Possible values are IPV4_ONLY and IPV4_IPV6."
  type          =  string 
  default       = "IPV4_ONLY"
}

 variable "private_ip_google_access" {
  description   = "When enabled, VMs in this subnet without external IP addresses can access Google APIs and services by using Private Google Access(IPV4)."
  type          = bool 
  default       = "true"
}

/******************************************
	Router VARIABLES
 *****************************************/
 variable "router_name" {
  description   = "Name of the router"
  type          = string
  default       = "router"
}
/******************************************
	CLoud NAT VARIABLES
 *****************************************/
 variable "nat_name" {
  description   = "Name of the cloud nat"
  type          = string  
  default       = "nat"
}
/******************************************
	FIREWALL RULE NAME
 *****************************************/
 variable "internal_fwrule_name"{
  type = string
  default = "allow-internal"
}
variable "ssh_fwrule_name" {
  type = string
  default = "allow-ssh"
}

/******************************************
	GCP PRIVATE SERVICE ACCESS
 *****************************************/
variable "private_service_iprange_name" {
  description = "name of the Private connections to services"
  type        = string
  default     = "ip-range"
}

/******************************************
	PUB SUB VARIABLES
 *****************************************/
variable "pubsub_topic_name" {
  type  = string
  description = "name of the topic"
  default = "topic"
}

variable "pubsub_subscription_name" {
  type = string
  description = "name of the subscription"
  default = "sub"
}

variable "ack_deadline_seconds" {
  type = number
  description = "for pull subscriptions, this value is used as the initial value for the ack deadline"
  default = 300
}
variable "retain_acked_messages" {
  type = bool
  description = "indicates whether to retain acknowledged messages"
  default = false
}

/******************************************
	REDIS INSTANCE VARIABLES
 *****************************************/
  
variable "redis_vm_name" {
    type        = string
    default     = "redisca"
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
    default   = ""
}

/******************************************
	CLOUDSQL MYSQL VARIABLES
 *****************************************/

variable    "mysql_vm_name" {
    type    = string
    default = "mysql"
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
    default = null
}
variable    "mysql_public_network" {
    type    = string
    default = true
}

/******************************************
	CLOUDSQL Postgresql VARIABLES
 *****************************************/

variable    "pgsql_vm_name" {
    type    = string
    default = "pgsql"
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
    default = null
}

variable    "pgsql_public_network" {
    type    = bool
    default = true
}

/******************************************
	CLOUD STORAGE  VARIABLES
 *****************************************/

variable "bucket_name" {
    type    = string
    default = "cdn-appointy"
}

variable "bucket_location" {
    type    = string
    default = null
}
variable "bucket_uniform_level_access" {
    type    = bool
    default = false 
}

variable "bucket_origin_list" {
  type        = list
    default = null
}

variable "bucket_method" {
  type        = list
    default = null
}

variable "bucket_reponse_header" {
type        = list
default = null
}

variable "bucket_max_age_seconds" {
    type    = number
    default = 3600
}

variable "bucket_role" {
    type    = string
    default = null
}

variable "bucket_entity" {
    type    = string
    default = null
}
