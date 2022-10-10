resource "google_project_service" "vertexaiapi" {
  project = var.project_id
  service = "aiplatform.googleapis.com"
}
resource "google_vertex_ai_dataset" "dataset" {
  depends_on            = [google_project_service.vertexaiapi]
  project               = var.project_id
  display_name          = var.dataset_name
  metadata_schema_uri   = "gs://google-cloud-aiplatform/schema/dataset/metadata/image_1.0.0.yaml"
  region                = var.region
}

