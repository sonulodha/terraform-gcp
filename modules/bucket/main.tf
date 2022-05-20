resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.bucket_location
  force_destroy = true
  uniform_bucket_level_access = var.bucket_uniform_level_access

  cors {
    origin          = var.bucket_origin_list
    method          = var.bucket_method
    response_header = var.bucket_reponse_header
    max_age_seconds = var.bucket_max_age_seconds
  }
}
resource "google_storage_default_object_access_control" "publicaccess" {
  depends_on   = [google_storage_bucket.bucket]
  bucket = google_storage_bucket.bucket.name
  role   = var.bucket_role
  entity = var.bucket_entity
}
