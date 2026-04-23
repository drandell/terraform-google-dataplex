output "self_links" {
  value       = { for key, et in google_dataplex_entry_type.this : key => et.id }
  description = "Map of the entry types created"
}