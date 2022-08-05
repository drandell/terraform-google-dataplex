output "lake_self_links" {
  value = module.google_dataplex.lake_self_links
  description = "Map of self links to the defined Dataplex lakes"
}

output "lake_uids" {
  value = module.google_dataplex.lake_uids
  description = "Map of UIDs to the defined Dataplex lakes"
}

output "zone_self_links" {
  value = module.google_dataplex.zone_self_links
  description = "Map of self links to the defined Dataplex zones"
}

output "zone_uids" {
  value = module.google_dataplex.zone_uids
  description = "Map of UIDs to the defined Dataplex zones"
}
