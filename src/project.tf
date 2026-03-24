resource "google_project" "main" {
  folder_id       = var.google_project.folder_id
  org_id          = var.google_project.org_id
  billing_account = var.google_project.billing_account
  deletion_policy = var.google_project.deletion_policy

  name                = local.google_project.name
  project_id          = local.google_project.project_id
  auto_create_network = local.google_project.auto_create_network
  labels              = local.google_project.labels
}

resource "google_project_service" "main" {
  for_each = toset(local.google_project_service.service)
  project  = google_project.main.id
  service  = each.key

  disable_dependent_services = local.google_project_service.disable_dependent_services
  disable_on_destroy         = local.google_project_service.disable_on_destroy
}

resource "google_project_iam_member" "main" {
  for_each = local.google_project_iam_member__roles
  member   = google_service_account.main.member
  project  = google_project.main.project_id
  role     = each.key
}
