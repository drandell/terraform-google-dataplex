variable "project" {
  type        = string
  description = "(Required) The project ID to host the resource in"
}

variable "location" {
  type        = string
  description = "(Required) The location to host the resource in"
}

variable "assets" {
  type = list(object({
    id           = string,
    lake_id      = string,
    zone_id      = string,
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
      name = string,
      type = string
    })
  }))
  default     = []
  description = "(Optional) A list of asset objects"

  validation {
    condition     = alltrue([for asset in var.assets : contains(["STORAGE_BUCKET", "BIGQUERY_DATASET"], asset.resource_spec["type"])])
    error_message = "Supported resource spec types are 'STORAGE_BUCKET' or 'BIGQUERY_DATASET'"
  }
}

variable "lake_self_links" {
  type        = map(any)
  default     = {}
  description = "(Optional) A map of lake self_links"
}

variable "zone_self_links" {
  type        = map(any)
  default     = {}
  description = "(Optional) A map of zone self_links"
}
