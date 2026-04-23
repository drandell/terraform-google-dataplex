output "self_links" {
  value       = { for key, entry_group in google_dataplex_entry_group.this : key => entry_group.id }
  description = "Map of the entry groups created"
}