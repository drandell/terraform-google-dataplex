output "self_links" {
  value       = { for key, entry in google_dataplex_entry.this : key => entry.id }
  description = "Map of the entries created"
}
