
# Create a VPN Gateway for the target network - First Step in Wizard
resource "google_compute_vpn_gateway" "classic_target_gateway_vpn_1" {
  name    = "${var.host_project_id}-classic-target-gateway-vpn-1"
  project = local.projects.host_project.name
  network = local.networks.vpc_shared_network.name
  region  = var.region_id
}