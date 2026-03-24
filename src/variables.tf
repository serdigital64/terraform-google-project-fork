#
# Shared
#

variable "shared__name" {
  description = "Name seed to be used for naming generated module objects"
  sensitive   = false
  nullable    = false
  type        = string
}

variable "shared__location" {
  description = "GCP location where resources will be deployed to"
  sensitive   = false
  nullable    = false
  type        = string
}

variable "shared__prefix" {
  description = "Prefix definition for naming generated module objects"
  sensitive   = false
  nullable    = true
  type = object({
    google_project         = optional(string)
    google_service_account = optional(string)
    google_storage_bucket  = optional(string)
  })
  default = {}
}

variable "shared__labels" {
  description = "Common labels to be applied to all resources"
  sensitive   = false
  nullable    = true
  type        = map(string)
  default     = {}
}

#
# Google Project
#

variable "google_project" {
  description = "Google Project Attributes"
  sensitive   = false
  nullable    = true
  type = object({
    billing_account = optional(string)
    folder_id       = optional(string)
    org_id          = optional(string)
    deletion_policy = optional(string, "PREVENT")
    labels          = optional(map(string))
  })
  default = {}
}

variable "google_project_service" {
  description = "Google Project Services to enable"
  sensitive   = false
  nullable    = true
  type        = list(string)
  default     = []
}
