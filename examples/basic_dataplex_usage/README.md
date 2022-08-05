# Basic Data Catalog Usage

This example illustrates showcase  the basic dataplex features.

It will:
- Create a lake
- Create a zone within that lake

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|-------------------|---------|:--------:|
| project\_id | The project to host your resources in | `string` | n/a | yes |
| location | The location to host your resources in | `string` | n/a | yes |
| lakes | List of lake objects to create | <pre>list(object({<br>    id                 = string,<br>    display_name       = optional(string),<br>    description        = optional(string),<br>    labels             = optional(map(string), {}),<br>    dataproc_metastore = optional(string)<br>  }))</pre> | `[]` | no |
| zones | List of zone objects to create | <pre>list(object({<br>    id           = string,<br>    lake_id      = string,<br>    type         = string,<br>    display_name = optional(string),<br>    description  = optional(string),<br>    labels       = optional(map(string), {}),<br>    discovery_spec = object({<br>      enabled          = bool,<br>      schedule         = optional(string),<br>      include_patterns = optional(list(string), []),<br>      exclude_patterns = optional(list(string), []),<br>      csv_options = optional(object({<br>        delimiter              = optional(string, ","),<br>        header_rows            = optional(number, 0)<br>        disable_type_inference = optional(bool, false),<br>        encoding               = optional(string, "UTF-8")<br>      }))<br>      json_options = optional(object({<br>        disable_type_inference = optional(bool, false),<br>        encoding               = optional(string, "UTF-8")<br>      })),<br>    }),<br>    resource_spec = object({<br>      location_type = string<br>    })<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| lake\_self\_links | Map of self links to the defined Dataplex lakes |
| lake\_uids | Map of UIDs to the defined Dataplex lakes |
| zone\_self\_links | Map of self links to the defined Dataplex zones |
| zone\_uids | Map of UIDs to the defined Dataplex zones |

## Example Usage

See [`terraform.tfvars`](./terraform.tfvars) for some of the example usage.

## Notes

N/A