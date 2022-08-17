module "google_dataplex" {
  source = "../../"

  project_id = var.project_id
  location   = var.location
  lakes      = var.lakes
  zones      = var.zones
  assets     = var.assets
}
