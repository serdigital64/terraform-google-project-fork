resource "google_service_account" "main" {
  account_id                   = local.google_service_account.account_id
  display_name                 = local.google_service_account.description
  disabled                     = local.google_service_account.disabled
  create_ignore_already_exists = local.google_service_account.create_ignore_already_exists

  project = google_project.main.project_id
}
