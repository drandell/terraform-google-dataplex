project_id = "billing-budgets"
location   = "us-central1"
lakes = [
  {
    id           = "my-test-lake"
    display_name = "My Amazing Lake"
    description  = "its a big lake"
  }
]
zones = [
  {
    id      = "my-test-zone"
    lake_id = "my-test-lake"
    type    = "RAW"
    discovery_spec = {
      enabled = false
    }
    resource_spec = {
      location_type = "SINGLE_REGION"
    }
  }
]