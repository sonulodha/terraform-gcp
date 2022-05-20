terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.20.0"
    }
  }
}

provider "google" {
  credentials = file("./terraform-sa.json")
  project = "iteindia-playground"
  region  = "us-central1"
  zone    = "us-central1-c"
}
