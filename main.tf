terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {

  credentials = file(var.credentials_file)

  project = var.gcp_project
  region  = var.region
  zone    = var.zone
}
provider "google-beta" {
  project = var.gcp_project
}