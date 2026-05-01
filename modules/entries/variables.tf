variable "project" {
  type        = string
  description = "(Required) The project ID to host the resource in"
}

variable "location" {
  type        = string
  description = "(Required) The region to host the resource in"
}

variable "entries" {
  type = list(object({
    id                    = string
    type                  = string
    parent_entry_group_id = optional(string)
    entry_group_id        = optional(string)
    fully_qualified_name  = optional(string)
    location              = optional(string)
    project               = optional(string)
    source = object({
      resource     = optional(string)
      system       = optional(string)
      platform     = optional(string)
      display_name = optional(string)
      description  = optional(string)
      labels       = optional(map(string))
      create_time  = optional(string)
      update_time  = optional(string)
      ancestors = optional(map(object({
        name = string
        type = string
      })), {})
    })
  }))
  default     = []
  description = "(Optional) A list of entry objects"
}

variable "entry_group_self_links" {
  type        = map(any)
  default     = {}
  description = "(Optional) A map of entry group self_links"
}

variable "entry_type_self_links" {
  type        = map(any)
  default     = {}
  description = "(Optional) A map of entry type self_links"
}
