locals {
  entry_types = { for et in var.entry_types : et["id"] => et }
}

resource "google_dataplex_entry_type" "this" {
  for_each = local.entry_types

  entry_type_id = each.key
  project       = coalesce(each.value["project"], var.project)
  location      = coalesce(each.value["location"], var.location)
  display_name  = each.value["display_name"]
  description   = each.value["description"]
  labels        = each.value["labels"]
  type_aliases  = each.value["type_aliases"]
  system        = each.value["system"]
  platform      = each.value["platform"]

  dynamic "required_aspects" {
    for_each = alltrue([for k, v in values(each.value["required_aspects"]) : v == null]) ? {} : each.value["required_aspects"]
    content {
      type = required_aspects.value["type"]
    }
  }
}
