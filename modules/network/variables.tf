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
  default       = "172.31.31.0/24"
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