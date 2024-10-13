########################################################
# Create a Output Files to reuse generated information #
########################################################
resource "local_file" "export_subnet" {
  content = jsonencode({
    host_project = {
      name = google_project.host_project.name,
      id = google_project.host_project.id,
      number = google_project.host_project.number,
      }
    service_project = {
      name = google_project.service_project.name,
      id = google_project.service_project.id,
      number = google_project.service_project.number,
      }
  })
    filename = "./projects.json"
}
# resource "local_file" "export_reserved_ip" {
#   content = jsonencode({
#     host_project_nat_ip = {
#       name = google_compute_address.host_project_nat_ip.name,
#       address = google_compute_address.host_project_nat_ip.address,
#       self_link = google_compute_address.host_project_nat_ip.self_link,
#       }
#     host_project_vpn_ip_01 = {
#       name = google_compute_address.host_project_vpn_ip_01.name,
#       address = google_compute_address.host_project_vpn_ip_01.address,
#       self_link = google_compute_address.host_project_vpn_ip_01.self_link,
#       }
#     host_project_vpn_ip_02 = {
#       name = google_compute_address.host_project_vpn_ip_02.name,
#       address = google_compute_address.host_project_vpn_ip_02.address,
#       self_link = google_compute_address.host_project_vpn_ip_02.self_link,
#       }
#   })
#     filename = "./reserved-ip.json"
# }