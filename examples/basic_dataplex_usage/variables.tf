variable "project_id" {
  type        = string
  description = "(Required) The project ID to host the resource in"
}

variable "location" {
  type        = string
  description = "(Required) The location to host the resource in"
}

variable "lakes" {
  type = list(object({
    id                 = string,
    display_name       = optional(string),
    description        = optional(string),
    labels             = optional(map(string), {}),
    dataproc_metastore = optional(string)
  }))
  default     = []
  description = "(Optional) A list of lake objects"
}

variable "zones" {
  type = list(object({
    id           = string,
    lake_id      = string,
    type         = string,
    display_name = optional(string),
    description  = optional(string),
    labels       = optional(map(string), {}),
    discovery_spec = object({
      enabled          = bool,
      schedule         = optional(string),
      include_patterns = optional(list(string), []),
      exclude_patterns = optional(list(string), []),
      csv_options = optional(object({
        delimiter              = optional(string, ","),
        header_rows            = optional(number, 0)
        disable_type_inference = optional(bool, false),
        encoding               = optional(string, "UTF-8")
      }))
      json_options = optional(object({
        disable_type_inference = optional(bool, false),
        encoding               = optional(string, "UTF-8")
      })),
    }),
    resource_spec = object({
      location_type = string
    })
  }))
  default     = []
  description = "(Optional) A list of zone objects"

  validation {
    condition     = alltrue([for zone in var.zones : contains(["RAW", "CURATED", "TYPE_UNSPECIFIED"], zone.type)])
    error_message = "Supported types are 'RAW', 'CURATED', 'TYPE_UNSPECIFIED'."
  }

  validation {
    condition     = alltrue([for zone in var.zones : contains(["SINGLE_REGION", "MULTI_REGION", "LOCATION_TYPE_UNSPECIFIED"], zone.resource_spec["location_type"])])
    error_message = "Supported location types are 'SINGLE_REGION', 'MULTI_REGION', 'LOCATION_TYPE_UNSPECIFIED'."
  }
}