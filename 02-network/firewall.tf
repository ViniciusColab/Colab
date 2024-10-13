resource "google_compute_firewall" "allow_iap" {
    name          = "allow-iap"
    project       = local.projects.host_project.name
    network       = google_compute_network.vpc_shared_network.self_link   # "https://www.googleapis.com/compute/v1/projects/aiqfome-shared-proj-stg/global/networks/gke-vpc-network-stg"

    priority      = 1000
    direction     = "INGRESS"
    
    allow {
        protocol = "all"
    }
    
    source_ranges = [
            "35.235.240.0/20"
                    ]

    # target_tags = ["vpn"]
}