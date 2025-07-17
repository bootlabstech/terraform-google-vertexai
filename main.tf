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

resource "google_workbench_instance" "basic_instance" {
  project  = var.project_id
  provider = google
  name     = var.notebook_name
  location = var.zone

  gce_setup {
    machine_type = var.machine_type
    
    service_accounts {
      email  = var.service_account
      # scopes = var.service_account_scopes
    }

    boot_disk {
      disk_type    = var.boot_disk_type
      disk_size_gb = var.boot_disk_size_gb
      disk_encryption = "CMEK"
      kms_key = var.kms_key
    }

    data_disks {
      disk_type    = var.data_disk_type
      disk_size_gb = var.data_disk_size_gb
      disk_encryption = "CMEK"
      kms_key = var.kms_key
    }

    disable_public_ip = var.no_public_ip
    enable_ip_forwarding = false
    
    network_interfaces {
      network    = var.network
      subnet     = var.subnetwork
      #nic_type   = "GVNIC"
    }

    vm_image {
      project = var.vm_image_project
      family  = var.vm_image_family
    }

    metadata = {
      startup-script = "sudo chmod -R a+w /home/jupyter && sudo chown -R jupyter:jupyter /home/jupyter"
    }
  }

  depends_on = [
    google_project_service.notebooks
  ]
}