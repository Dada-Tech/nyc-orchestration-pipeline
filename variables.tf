locals {
  credentials = "./keys/hopeful-cred.json"
  project = "hopeful-machine-405721"
  bucket_name = "data_tech_main_bucket"
}

# choose region based on your location, https://cloud.google.com/about/locations.
# montreal is northamerica-northeast1
variable "region" {
  description = "Region for GCP resources. Choose as per your location: https://cloud.google.com/about/locations"
  default = "northamerica-northeast1"
  type = string
}

# Equivalent to schema in data warehouse
variable "BQ_DATASET" {
  description = "BigQuery Dataset that raw data (from GCS) will be written to"
  type = string
  default = "trips_data_all"
}