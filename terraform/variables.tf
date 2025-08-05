variable "credentials" {
  description = "The path to the service account key file"
  type        = string
  default = "/home/gabriel/.config/gcloud/application_default_credentials.json"
}

variable "project" {
  description = "The GCP project ID"
  type        = string
  default = "airy-coil-393209"
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "asia-south1"
}

variable "zone" {
  description = "The GCP zone"
  type        = string
  default     = "asia-south1-a"
}

variable "service_account_email" {
  description = "Service Account Email"
  type        = string
  default = "ferreiragabrielsousa@gmail.com"
}

variable "public_key_path" {
  description = "Path to the local SSH public key file."
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_user" {
  description = "The username to be associated with the SSH key."
  type        = string
  default     = "gabriel"
}
