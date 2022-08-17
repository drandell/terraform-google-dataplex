output "asset_self_links" {
  value       = module.dataplex_assets.self_links
  description = "Map of self links to the defined Dataplex assets"
}

output "asset_uids" {
  value       = module.dataplex_assets.uids
  description = "Map of UIDs to the defined Dataplex assets"
}

output "lake_self_links" {
  value       = module.dataplex_lakes.self_links
  description = "Map of self links to the defined Dataplex lakes"
}

output "lake_uids" {
  value       = module.dataplex_lakes.uids
  description = "Map of UIDs to the defined Dataplex lakes"
}

output "zone_self_links" {
  value       = module.dataplex_zones.self_links
  description = "Map of self links to the defined Dataplex zones"
}

output "zone_uids" {
  value       = module.dataplex_zones.uids
  description = "Map of UIDs to the defined Dataplex zones"
}
