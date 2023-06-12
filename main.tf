resource "google_project_service" "vertexaiapi" {
  project = var.project_id
  service = "aiplatform.googleapis.com"
}
resource "google_project_service" "notebooks" {
  project            = var.project_id
  provider           = google
  service            = "notebooks.googleapis.com"
  disable_on_destroy = true
}

resource "google_notebooks_instance" "basic_instance" {
  project                = var.project_id
  provider               = google
  name                   = var.notebook_name
  location               = var.zone
  machine_type           = var.machine_type
  service_account        = var.service_account
  service_account_scopes = var.service_account_scopes
  boot_disk_type         = var.boot_disk_type
  boot_disk_size_gb      = var.boot_disk_size_gb
  data_disk_type         = var.data_disk_type
  data_disk_size_gb      = var.data_disk_size_gb
  no_remove_data_disk    = var.no_remove_data_disk
  disk_encryption        = "CMEK"
  kms_key                = var.kms_key
  no_public_ip           = var.no_public_ip
  no_proxy_access        = var.no_proxy_access
  network                = var.network
  subnet                 = var.subnetwork
  vm_image {
    project      = var.vm_image_project
    image_family = var.vm_image_family
  }
  # accelerator_config {
  #   type       = var.accelerator_type
  #   core_count = var.accelerator_core_count
  # }

  depends_on = [
    google_project_service.notebooks
  ]
}


