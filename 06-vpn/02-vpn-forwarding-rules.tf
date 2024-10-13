resource "google_compute_forwarding_rule" "classic_vpn_1_rule_esp" {
  name                  = "${var.host_project_id}-classic-vpn-1-rule-esp"
  project               = "${var.host_project_id}"
  region                = "${var.region_id}"

  ip_protocol           = "ESP"
  load_balancing_scheme = "EXTERNAL"
  network_tier          = "PREMIUM"

  target                = google_compute_vpn_gateway.classic_target_gateway_vpn_1.self_link

  ip_address            = local.reserved_ip.host_project_vpn_ip_01.address
}

resource "google_compute_forwarding_rule" "classic_vpn_1_rule_udp500" {
  name                  = "${var.host_project_id}-classic-vpn-1-rule-udp500"
  project               = "${var.host_project_id}"
  region                = "${var.region_id}"

  ip_protocol           = "UDP"
  load_balancing_scheme = "EXTERNAL"
  network_tier          = "PREMIUM"
  port_range            = "500-500"

  target                = google_compute_vpn_gateway.classic_target_gateway_vpn_1.self_link

  ip_address            = local.reserved_ip.host_project_vpn_ip_01.address
}

resource "google_compute_forwarding_rule" "classic_vpnc_1_rule_udp4500" {
  name                  = "${var.host_project_id}-classic-vpn-1-rule-udp4500"
  project               = "${var.host_project_id}"
  region                = "${var.region_id}"

  ip_protocol           = "UDP"
  load_balancing_scheme = "EXTERNAL"
  network_tier          = "PREMIUM"
  port_range            = "4500-4500"

  target                = google_compute_vpn_gateway.classic_target_gateway_vpn_1.self_link
  ip_address            = local.reserved_ip.host_project_vpn_ip_01.address
}