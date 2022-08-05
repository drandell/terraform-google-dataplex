locals {
  zones = { for zone in var.zones : zone["id"] => zone }
}

resource "google_dataplex_zone" "this" {
  for_each = local.zones

  location = var.location
  project  = var.project
  lake     = var.lake_self_links[each.value["lake_id"]]

  name         = each.key
  type         = each.value["type"]
  description  = each.value["description"]
  display_name = each.value["display_name"]
  labels       = each.value["labels"]

  discovery_spec {
    enabled          = each.value["discovery_spec"]["enabled"]
    include_patterns = each.value["discovery_spec"]["include_patterns"]
    exclude_patterns = each.value["discovery_spec"]["exclude_patterns"]
    schedule         = each.value["discovery_spec"]["schedule"]

    dynamic "csv_options" {
      for_each = each.value["discovery_spec"]["csv_options"] != null ? { "csv_opt" : each.value["discovery_spec"]["csv_options"] } : {}
      content {
        delimiter              = csv_options.value["delimiter"]
        header_rows            = csv_options.value["header_rows"]
        disable_type_inference = csv_options.value["disable_type_inference"]
        encoding               = csv_options.value["encoding"]
      }
    }

    dynamic "json_options" {
      for_each = each.value["discovery_spec"]["json_options"] != null ? { "json_opt" : each.value["discovery_spec"]["json_options"] } : {}
      content {
        disable_type_inference = json_options.value["disable_type_inference"]
        encoding               = json_options.value["encoding"]
      }
    }
  }

  resource_spec {
    location_type = each.value["resource_spec"]["location_type"]
  }
}
