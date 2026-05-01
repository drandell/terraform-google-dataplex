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

module "dataplex_assets" {
  source = "./modules/assets"

  project         = var.project_id
  location        = var.location
  assets          = var.assets
  lake_self_links = module.dataplex_lakes.self_links
  zone_self_links = module.dataplex_zones.self_links

  depends_on = [
    module.dataplex_lakes,
    module.dataplex_zones
  ]
}

module "dataplex_entry_types" {
  source = "./modules/entry_types"

  entry_types = var.entry_types
  project     = var.project_id
  location    = var.location
}

module "dataplex_entry_groups" {
  source = "./modules/entry_groups"

  entry_groups = var.entry_groups
  project      = var.project_id
  location     = var.location
}

module "dataplex_entries" {
  source = "./modules/entries"

  entries  = var.entries
  project  = var.project_id
  location = var.location

  entry_group_self_links = module.dataplex_entry_groups.self_links
  entry_type_self_links  = module.dataplex_entry_types.self_links

  depends_on = [
    module.dataplex_entry_groups,
    module.dataplex_entry_types
  ]
}
