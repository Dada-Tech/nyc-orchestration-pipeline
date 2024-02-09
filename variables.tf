# locals equivalent to constants
locals {
  data_lake_bucket = "dtc_data_lake"
  credentials = "$HOME/google-cloud-sdk/data-dtc-405718-405917c9f117.json"
}

# variable will generally parsed at runtime, and can be default defined.
# no default defined, so it will prompt you and ask when you tf plan. eg hopeful-machine-405721
variable "project" {
  description = "Your GCP Project ID"
}

# choose region based on your location, https://cloud.google.com/about/locations.
# montreal is northamerica-northeast1
variable "region" {
  description = "Region for GCP resources. Choose as per your location: https://cloud.google.com/about/locations"
  default = "northamerica-northeast1"
  type = string
}

variable "storage_class" {
  description = "Storage class type for your bucket. Check official docs for more info."
  default = "STANDARD"
}

# Equivalent to schema in data warehouse
variable "BQ_DATASET" {
  description = "BigQuery Dataset that raw data (from GCS) will be written to"
  type = string
  default = "trips_data_all"
}

variable "TABLE_NAME" {
  description = "BigQuery Table"
  type = string
  default = "ny_trips"
}