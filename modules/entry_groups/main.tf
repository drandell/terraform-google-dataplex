locals {
  groups = { for group in var.entry_groups : group["id"] => group }
}

resource "google_dataplex_entry_group" "this" {
  for_each = local.groups

  entry_group_id = each.key
  display_name   = each.value.display_name
  description    = each.value.description

  project  = coalesce(each.value["project"], var.project)
  location = coalesce(each.value["location"], var.location)
}
