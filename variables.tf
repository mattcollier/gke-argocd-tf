variable "project_id" {
  type        = string
  description = "GCP project to deploy into"
}

variable "region" {
  type        = string
  description = "Region for the Autopilot cluster"
  default     = "us-central1"
}
