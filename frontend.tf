resource "google_cloud_run_service" "frontend" {
  name     = "front-${var.project}"
  location = var.region

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_policy" "noauth_fe" {
  location    = google_cloud_run_service.frontend.location
  project     = google_cloud_run_service.frontend.project
  service     = google_cloud_run_service.frontend.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

resource "google_compute_backend_service" "frontend" {
	name = "frontend-${var.project}"
	enable_cdn = true
	backend {
		group = google_compute_region_network_endpoint_group.frontend.id
	}
}

resource "google_compute_region_network_endpoint_group" "frontend" {
  provider              = google-beta
  name                  = "${var.project}-neg-frontend"
  network_endpoint_type = "SERVERLESS"
  region                = var.region
  cloud_run {
    service = google_cloud_run_service.frontend.name
  }
}
