resource "google_compute_network" "vpc" {
  name                          = var.vpc_name
  auto_create_subnetworks       = var.auto_create_subnet
  routing_mode                  = var.routing_mode
}

resource "google_compute_subnetwork" "subnet" {
  depends_on                    = [google_compute_network.vpc]
  name                          = var.subnet_name
  ip_cidr_range                 = var.ip_cidr_range
  region                        = var.subnet_region
  network                       = var.vpc_name
  stack_type                    = var.stack_type
  private_ip_google_access      = var.private_ip_google_access
}

resource "google_compute_router" "router" {
  depends_on                    = [google_compute_subnetwork.subnet]
  name                          = var.router_name
  region                        = var.subnet_region
  network                       = var.vpc_name
  bgp {   
      asn   =   64514
  }
}

resource "google_compute_router_nat" "nat" {
  depends_on                    = [google_compute_router.router]
  name                          = var.nat_name
  router                        = var.router_name
  region                        = var.subnet_region
  nat_ip_allocate_option        = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config {
      enable=true
      filter="ERRORS_ONLY"
  }
}

resource "google_compute_firewall" "ssh" {
  depends_on                    = [google_compute_subnetwork.subnet]
  name                          = var.ssh_fwrule_name
  network                       = var.vpc_name
  direction                     = "INGRESS"
  priority                      = "65534"
  source_ranges                 = ["0.0.0.0/0"]
  allow {   
      protocol  = "tcp"
      ports     = ["22"]
  }
}

resource "google_compute_firewall" "internal" {
  depends_on                    = [google_compute_subnetwork.subnet]
  name                          = var.internal_fwrule_name
  network                       = var.vpc_name
  direction                     = "INGRESS"
  priority                      = "65534"
  source_ranges                 = [var.ip_cidr_range]
  allow {
      protocol  = "icmp"
  }
  allow {
      protocol  = "tcp"
      ports     = ["0-65535"]
  }
  allow {   
      protocol  = "udp"
      ports     = ["0-65535"]  
  }
}

resource "google_compute_global_address" "service_ip_address" {
  depends_on    = [google_compute_network.vpc]
  name          = var.private_service_iprange_name
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 20
  network       = var.vpc_name
}

resource "google_service_networking_connection" "private_vpc_connection" {
  depends_on              = [google_compute_global_address.service_ip_address]
  network                 = var.vpc_name
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.service_ip_address.name]
}
