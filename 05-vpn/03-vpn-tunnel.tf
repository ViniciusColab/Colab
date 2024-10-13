#################################
# Create the Classic VPN Tunnel #
#################################
# Create a VPN Tunnel 1 to Classiv VPN Gateway
resource "google_compute_vpn_tunnel" "classic_vpn_tunnel_1" {
  name                    = "${var.host_project_id}-classic-vpn-tunnel-1"
  project                 = local.projects.host_project.name
  region                  = var.region_id
 
#   target_vpn_gateway      = "https://www.googleapis.com/compute/v1/projects/nasajon-network-host-qa/regions/southamerica-east1/targetVpnGateways/nasajon-qa-aws-vpn-1"
  target_vpn_gateway      = google_compute_vpn_gateway.classic_target_gateway_vpn_1.self_link
  
  local_traffic_selector  = ["0.0.0.0/0"]
  remote_traffic_selector = ["0.0.0.0/0"]
 
  peer_ip                 = "35.184.48.88" # Get from Other Provider VPN Gateway
  ike_version             = 2
  shared_secret           = "werTYU1@3"
}

# # Create a VPN Tunnel 1 to Classiv VPN Gateway
# resource "google_compute_vpn_tunnel" "classic_vpn_tunnel_2" {
#   name                    = "${var.host_project_id}-classic-vpn-tunnel-2"
#   project                 = local.projects.host_project.name
#   region                  = var.region_id
 
# #   target_vpn_gateway      = "https://www.googleapis.com/compute/v1/projects/nasajon-network-host-qa/regions/southamerica-east1/targetVpnGateways/nasajon-qa-aws-vpn-1"
#   target_vpn_gateway      = google_compute_vpn_gateway.classic_target_gateway_vpn_1.self_link
  
#   local_traffic_selector  = ["0.0.0.0/0"]
#   remote_traffic_selector = ["0.0.0.0/0"]
 
#   peer_ip                 = "34.30.88.143" # Get from Other Provider VPN Gateway
#   ike_version             = 2
#   shared_secret           = "werTYU1@3"
# }