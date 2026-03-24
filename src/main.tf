module "lib_catalog" {
  source  = "registry.terraform.io/automation64/catalog/lib"
  version = "v1.1.0"
}

module "google_storage_bucket_file" {
  source  = "registry.terraform.io/automation64/storage-bucket-file/google"
  version = "v1.1.0"

  shared__name     = var.shared__name
  shared__location = var.shared__location

  shared__prefix = {
    google_storage_bucket = local.shared__prefix.google_storage_bucket
  }

  google_storage_bucket = {
    project = google_project.main.project_id
  }
}

resource "google_storage_bucket_iam_member" "main" {
  for_each = local.google_storage_bucket_iam_member__roles
  member   = google_service_account.main.member
  bucket   = module.google_storage_bucket_file.google_storage_bucket.name
  role     = each.key
}
