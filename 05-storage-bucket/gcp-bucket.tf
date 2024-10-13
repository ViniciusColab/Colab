resource "google_storage_bucket" "int_crit_project_bucket_images" {
  name                     = "${var.service_project_id}-vm-images-${var.env}"
  project                  = local.projects.service_project.name
  location                 = "${var.region_id}"

  storage_class            = "STANDARD"
  public_access_prevention = "enforced"
#   public_access_prevention = "uniform"

  autoclass {
    enabled = true
  }

  labels = {
    type = "vm-images"
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 3
      with_state         = "ARCHIVED"
    }
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      days_since_noncurrent_time = 7
      with_state                 = "ANY"
    }
  }

  force_destroy = false

}