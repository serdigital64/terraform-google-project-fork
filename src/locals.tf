locals {
  #
  # Shared
  #

  shared__labels = {
    at64_shared__automated      = "true"
    at64_shared__module_type    = "terraform"
    at64_shared__module_name    = "terraform-google-project"
    at64_shared__module_version = "1-0-0"
  }

  shared__name_instance = "${var.shared__name}-${format("%04d", random_integer.main.result)}"

  shared__prefix = {
    google_project         = coalesce(var.shared__prefix.google_project, module.lib_catalog.pgg.project)
    google_service_account = coalesce(var.shared__prefix.google_service_account, module.lib_catalog.pgg.service_account)
    google_storage_bucket  = coalesce(var.shared__prefix.google_storage_bucket, module.lib_catalog.pgg.storage_bucket)
  }

  #
  # Google Project
  #

  google_project = {
    name                = "${local.shared__prefix.google_project}-${var.shared__name}"
    project_id          = "${local.shared__prefix.google_project}-${local.shared__name_instance}"
    auto_create_network = false
    labels = merge(
      local.shared__labels,
      var.shared__labels
    )
  }

  google_project_service = {
    disable_dependent_services = false
    disable_on_destroy         = true
    service = concat(
      var.google_project_service, [
        "cloudasset.googleapis.com",
        "geminicloudassist.googleapis.com",
        "iam.googleapis.com",
        "logging.googleapis.com",
        "storage.googleapis.com"
    ])
  }

  google_project_iam_member__roles = toset([
    "roles/serviceusage.serviceUsageAdmin",
    "roles/owner"
  ])

  #
  # Google Service Account
  #

  google_service_account = {
    account_id                   = "${local.shared__prefix.google_service_account}-${local.shared__name_instance}"
    description                  = "Dedicated Service Account for Project Management Automation"
    disabled                     = false
    create_ignore_already_exists = false
  }

  #
  # Google Storage Bucket
  #

  google_storage_bucket_iam_member__roles = toset([
    "roles/storage.admin"
  ])
}
