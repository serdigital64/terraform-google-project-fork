#
# Google Project
#

output "google_project" {
  description = "Google Project Attributes"
  value       = google_project.main
  sensitive   = false
}

output "google_project_services" {
  description = "Google Project Services"
  value       = google_project_service.main
  sensitive   = false
}

output "google_project_iam_member" {
  description = "Google Project IAM Member"
  value       = google_project_iam_member.main
  sensitive   = false
}

#
# Google Service Account
#

output "google_service_account" {
  description = "Google Service Account Attributes"
  value       = google_service_account.main
  sensitive   = false
}

#
# Google Storage Bucket
#

output "google_storage_bucket" {
  description = "Google Storage Bucket Attributes"
  value       = module.google_storage_bucket_file.google_storage_bucket
  sensitive   = false
}

output "google_storage_bucket_iam_member" {
  description = "Google Storage Bucket IAM Member"
  value       = google_storage_bucket_iam_member.main
  sensitive   = false
}
