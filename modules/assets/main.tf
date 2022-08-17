locals {
  assets = { for asset in var.assets : asset["id"] => asset }
}

resource "google_dataplex_asset" "this" {
  for_each = local.assets

  location      = var.location
  project       = var.project
  lake          = var.lake_self_links[each.value["lake_id"]]
  dataplex_zone = var.zone_self_links[each.value["zone_id"]]

  name         = each.key
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
    name = each.value["resource_spec"]["name"]
    type = each.value["resource_spec"]["type"]
  }
}
