# ################################
# # Reserve NAT IP Router to VPN #
# ################################
# # Create a Reseverd IP to the Load Balancer
# resource "google_compute_address" "host_project_nat_ip" {
#   name    = "${var.host_project_id}-nat-ip-${var.env}"
#   project = google_project.host_project.project_id
#   region  = var.region_id
#   ip_version = "IPV4"
#   address_type = "EXTERNAL"
# }

# #####################################
# # Reserved VPN to Classic Cloud VPN #
# #####################################
# # Create a Reseverd IPs to VPN
# resource "google_compute_address" "host_project_vpn_ip_01" {
#   name    = "${var.host_project_id}-vpn-ip-01-${var.env}"
#   project = google_project.host_project.project_id
#   region  = var.region_id
#   ip_version = "IPV4"
#   address_type = "EXTERNAL"
# }
# resource "google_compute_address" "host_project_vpn_ip_02" {
#   name    = "${var.host_project_id}-vpn-ip-02-${var.env}"
#   project = google_project.host_project.project_id
#   region  = var.region_id
#   ip_version = "IPV4"
#   address_type = "EXTERNAL"
# }

# # # Generate Outputs files ../local/output_lb_ip.json
# # resource "local_file" "output_lb_ip" {
# #   content = jsonencode({
# #     host_project_nat_ip = google_compute_address.host_project_nat_ip.address,
# #     host_project_nat_ip_self_link = google_compute_address.host_project_nat_ip.self_link
# #   })
# #   filename = "./reserved_ip.json"
# # }