provider "google" {
  credentials = file("sa_key.json")
  project     = "stock-marketing-project"
  region      = "europe-west1"
}

resource "google_storage_bucket" "static" {
 name          = "fmp-stock-company-data-bucket"
 location      = "EU"
 storage_class = "STANDARD"

 uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "company_data" {
  name         = "companies_data.json"
  source       = "../data/companies_data.json"
  content_type = "application/json"
  bucket       = google_storage_bucket.static.name
}

resource "google_bigquery_dataset" "fmp_dataset" {
  dataset_id = "fmp_data"
  location   = "EU"
}