output "self_links" {
  value       = { for key, asset in google_dataplex_asset.this : key => asset.id }
  description = "Map of self links of our defined assets"
}

output "uids" {
  value       = { for key, asset in google_dataplex_asset.this : key => asset.uid }
  description = "Map of UIDs of our defined assets"
}
