##############################
# Create a VPN Tunnel Routes #
##############################
# Create a VPN Tunnel Routes for the VPN Tunnel 1
resource "google_compute_route" "classic_vpn_tunnel_1_route_1" {
  name                = "${var.host_project_id}-classic-tunnel-1-route-2"
  project             = local.projects.host_project.name
  network             = local.networks.vpc_shared_network.name

  next_hop_vpn_tunnel = google_compute_vpn_tunnel.classic_vpn_tunnel_1.self_link
  
  priority            = 1000
  dest_range          = "192.168.128.0/24" # Get from Other Provider VPC CIDR

  depends_on = [ google_compute_vpn_tunnel.classic_vpn_tunnel_1 ]
}
# # Create a VPN Tunnel Routes for the VPN Tunnel 2
# resource "google_compute_route" "classic_vpn_tunnel_2_route_1" {
#   name                = "${var.host_project_id}-tunnel-2-route-2"
#   project             = local.projects.host_project.name
#   network             = local.networks.vpc_shared_network.name
  
#   next_hop_vpn_tunnel = google_compute_vpn_tunnel.classic_vpn_tunnel_2.self_link
  
#   priority            = 1000
#   dest_range          = "192.168.128.0/24" # Get from Other Provider VPC CIDR
# }