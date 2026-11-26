terraform {
  required_version = ">= 1.6.0"

  backend "gcs" {
    bucket = "pfl-terraform-state"
    prefix = "landingzone/bootstrap"
  }

  required_providers {

    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
  }
}

provider "google" {
  region = var.region
}