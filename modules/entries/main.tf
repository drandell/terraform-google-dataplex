locals {
  entries = { for entry in var.entries : entry["id"] => entry }
}

resource "google_dataplex_entry" "this" {
  for_each = local.entries

  entry_id             = each.key
  entry_type           = try(var.entry_type_self_links[each.value["type"]], each.value["type"])
  location             = coalesce(each.value["location"], var.location)
  project              = coalesce(each.value["project"], var.project)
  parent_entry         = each.value["parent_entry_group_id"]
  entry_group_id       = try(var.entry_group_self_links[each.value["entry_group_id"]].id, each.value["entry_group_id"])
  fully_qualified_name = each.value["fully_qualified_name"]

  dynamic "aspects" {
    for_each = alltrue([for k, v in values(each.value["aspects"]) : v == null]) ? {} : each.value["aspects"]
    content {
      aspect_key = aspects.key
      aspect {
        data = jsonencode(aspects.value)
      }
    }
  }

  entry_source {
    resource     = each.value["source"]["resource"]
    system       = each.value["source"]["system"]
    platform     = each.value["source"]["platform"]
    display_name = each.value["source"]["display_name"]
    description  = each.value["source"]["description"]
    labels       = each.value["source"]["labels"]
    create_time  = each.value["source"]["create_time"]
    update_time  = each.value["source"]["update_time"]

    dynamic "ancestors" {
      for_each = alltrue([for k, v in values(each.value["source"]["ancestors"]) : v == null]) ? {} : each.value["source"]["ancestors"]
      content {
        name = ancestors.value["name"]
        type = ancestors.value["type"]
      }
    }
  }
}
