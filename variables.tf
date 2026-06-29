variable "region" {
  type = string
  description = "the region of the dataset"
}
variable "zone" {
  type = string
  description = "the zone of the vertex ai notebook"
}
variable "project_id" {
  type = string
  description = "this is the id of the project"
}
variable "notebook_name" {
  type = string
  description = "notebook_name"
}
variable "machine_type" {
  type = string
  description = "machine_type"
}
variable "service_account" {
  type        = string
  description = "Service account email to attach to the notebook instance"
  default     = "vertex-notebook-sa@mpaas-sandbox-965286.iam.gserviceaccount.com"
}
variable "boot_disk_size_gb" {
  type = number
  description = "boot_disk_size_gb"
}
variable "boot_disk_type" {
  type = string
  description = "boot_disk_type"
}
variable "data_disk_type" {
  type = string
  description = "data_disk_type"
}
variable "data_disk_size_gb" {
  type = number
  description = "data_disk_size_gb"
}
variable "kms_key" {
  type = string
  description = "kms_key"
}
variable "no_public_ip" {
  type = bool
  description = "no_public_ip"
}
variable "network" {
  type = string
  description = "network"
}
variable "subnetwork" {
  type = string
  description = "subnetwork"
}
variable "vm_image_project" {
  type        = string
  description = "GCP project hosting the Workbench VM image (use cloud-notebooks-managed for WBI)"
  default     = "cloud-notebooks-managed"
}
variable "vm_image_family" {
  type        = string
  description = "VM image family for the Workbench instance (unified multi-framework image)"
  default     = "workbench-instances"
}
variable "idle_timeout_seconds" {
  type        = string
  description = "Idle timeout in seconds before auto-shutdown (e.g. 10800 = 3 hours, 0 = disabled)"
  default     = "10800"
}