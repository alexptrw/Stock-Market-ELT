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

resource "google_bigquery_table" "fmp_data_bronze" {
  dataset_id = google_bigquery_dataset.fmp_dataset.dataset_id
  table_id   = "fmp_data"
  # location   = "EU"

  external_data_configuration {
    autodetect  = true
    source_uris = [
       "gs://${google_storage_bucket.static.name}/companies_data.json"
    ]
    source_format = "NEWLINE_DELIMITED_JSON"
  }
}

resource "google_bigquery_dataset" "fmp_dataset" {
  dataset_id = "fmp_data"
  location   = "EU"
}