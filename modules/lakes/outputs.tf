output "self_links" {
  value       = { for key, lake in google_dataplex_lake.this : key => lake.id }
  description = "Map of self links of our defined lakes"
}

output "uids" {
  value       = { for key, lake in google_dataplex_lake.this : key => lake.uid }
  description = "Map of UIDs of our defined lakes"
}
