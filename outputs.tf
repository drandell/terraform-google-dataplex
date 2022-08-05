output "lake_self_links" {
  value       = module.dataplex_lakes.self_links
  description = "Map of self links to the defined Dataplex lakes"
}

output "lake_uids" {
  value       = module.dataplex_lakes.uids
  description = "Map of UIDs to the defined Dataplex lakes"
}
