resource "google_project_service" "vertexaiapi" {
  project = var.project_id
  service = "aiplatform.googleapis.com"
}
resource "google_project_service" "notebooks" {
  project            = var.project_id
  provider           = google
  service            = "notebooks.googleapis.com"
  disable_on_destroy = false
}

resource "google_notebooks_instance" "basic_instance" {
  project                = var.project_id
  provider               = google
  name                   = "notebooks-instance-basic"
  location               = var.zone
  machine_type           = "n1-standard-1"
  service_account        = var.service_account
  service_account_scopes = var.service_account_scopes
  boot_disk_type         = var.boot_disk_type
  boot_disk_size_gb      = var.boot_disk_size_gb
  data_disk_type         = var.data_disk_type
  data_disk_size_gb      = var.data_disk_size_gb
  no_remove_data_disk    = var.no_remove_data_disk
  # kms_key                = var.kms_key
  no_public_ip           = var.no_public_ip
  no_proxy_access        = var.no_proxy_access
  network                = var.network
  subnet                 = var.subnetwork

  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-ent-2-9-cu113-notebooks"
  }
  # accelerator_config {
  #   type       = var.accelerator_type
  #   core_count = var.accelerator_core_count
  # }

  depends_on = [
    google_project_service.notebooks
  ]
}


