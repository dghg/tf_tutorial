resource "google_storage_bucket" "storage" {
  
  name          = "storage-${var.project}"
  location      = "ASIA-NORTHEAST3"
  force_destroy = true

  cors {
    origin          = ["*"]
    method          = ["GET"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.storage.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_compute_backend_bucket" "static" {
  name        = "bucket-${var.project}"
  bucket_name = google_storage_bucket.storage.name
  enable_cdn  = true
}
