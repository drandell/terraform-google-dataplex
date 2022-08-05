locals {
  lakes = { for lake in var.lakes : lake["id"] => lake }
}

resource "google_dataplex_lake" "this" {
  for_each = local.lakes

  name         = each.key
  project      = var.project
  location     = var.location
  description  = each.value["description"]
  display_name = each.value["display_name"]
  labels       = each.value["labels"]

  dynamic "metastore" {
    for_each = each.value["dataproc_metastore"] != null ? { "meta" : each.value["dataproc_metastore"] } : {}
    content {
      service = metastore.value
    }
  }
}
