#################################
# VPN Router to Announce Routes #
#################################
# Create a compute router
resource "google_compute_router" "classic_vpn_vpn_router" {
  name    = "${var.host_project_id}-classic-vpn-router-${var.env}"
  project = local.projects.host_project.name
  region  = var.region_id

  network = local.networks.vpc_shared_network.name

  bgp {
    advertise_mode     = "DEFAULT"
    asn                = 64512
    keepalive_interval = 60
  }
}