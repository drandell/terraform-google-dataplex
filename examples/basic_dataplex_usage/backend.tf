terraform {
  backend "gcs" {
    bucket = "billing-budgets-tf-state"
    prefix = "terraform/dataplex/state"
  }
}