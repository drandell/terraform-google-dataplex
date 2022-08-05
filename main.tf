module "dataplex_lakes" {
  source = "./modules/lakes"

  project  = var.project_id
  location = var.location
  lakes    = var.lakes
}

module "dataplex_zones" {
  source = "./modules/zones"

  project         = var.project_id
  location        = var.location
  zones           = var.zones
  lake_self_links = module.dataplex_lakes.self_links

  depends_on = [
    module.dataplex_lakes
  ]
}
