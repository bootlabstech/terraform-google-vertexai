variable "region" {
  type        = string
  description = "the region of the dataset"
}
variable "zone" {
  type        = string
  description = "the zone of the vertex ai notebook"
}
variable "project_id" {
  type        = string
  description = "this is the id of the project."
}
variable "notebook_name" {
  type        = string
  description = "notebook_name"
}
variable "machine_type" {
  type        = string
  description = "machine_type"
}
variable "service_account" {
  type        = string
  description = "service_account"
}
variable "service_account_scopes" {
  type        = list(string)
  description = "service_account_scopes"
}
variable "boot_disk_size_gb" {
  type        = number
  description = "boot_disk_size_gb"
}
variable "boot_disk_type" {
  type        = string
  description = "boot_disk_type"
}
variable "data_disk_type" {
  type        = string
  description = "data_disk_type"
}
variable "data_disk_size_gb" {
  type        = number
  description = "data_disk_size_gb"
}
variable "no_remove_data_disk" {
  type        = bool
  description = "no_remove_data_disk"
}
variable "kms_key" {
  type        = string
  description = "kms_key"
}
variable "no_proxy_access" {
  type        = bool
  description = "no_proxy_access"
}
variable "no_public_ip" {
  type        = bool
  description = "no_public_ip"
}
variable "network" {
  type        = string
  description = "network"
}
variable "subnetwork" {
  type        = string
  description = "subnetwork"
}
variable "vm_image_project" {
  type        = string
  description = "vm_image_project"
}
variable "vm_image_family" {
  type        = string
  description = "vm_image_family"
}
# variable "accelerator_core_count" {
#   type        = number
#   description = "accelerator_core_count"
# }
# variable "accelerator_type" {
#   type        = string
#   description = "accelerator_type"
# }

