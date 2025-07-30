resource "google_project_service" "services" {
  for_each = toset([
    "container.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ])
  project            = var.project_id
  service            = each.key
  disable_on_destroy = false
}

resource "time_sleep" "wait_for_apis" {
  create_duration = "300s"
  depends_on      = [google_project_service.services]
}
