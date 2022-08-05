output "self_links" {
  value       = { for key, zone in google_dataplex_zone.this : key => zone.id }
  description = "Map of self links of our defined zones"
}

output "uids" {
  value       = { for key, zone in google_dataplex_zone.this : key => zone.uid }
  description = "Map of UIDs of our defined zones"
}
