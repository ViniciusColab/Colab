# This file is used to create firewall rules for VPN traffic
resource "google_compute_firewall" "allow-vpn-traffic" {
    name    = "allow-vpn-traffic"
    network = local.networks.vpc_shared_network.name
    project = local.projects.host_project.name

    priority      = 1000
    direction     = "INGRESS"

    allow {
        protocol = "all"
    }

    source_ranges = [
            "34.30.88.143/32", # Get from Other Provider VPN Gateway
            "192.168.0.0/16" # Get from Other Provider VPC CIDR
                     ]

    # target_tags = ["vpn"]
}
