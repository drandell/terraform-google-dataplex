variable "entry_types" {
  type = list(object({
    id           = string
    location     = optional(string)
    project      = optional(string)
    type_aliases = optional(list(string))
    system       = optional(string)
    platform     = optional(string)
    display_name = optional(string)
    description  = optional(string)
    labels       = optional(map(string))
    required_aspects    = optional(map(object({
      type = string
    })), {})
  }))
  default     = []
  description = "(Optional) A list of entry type objects"
}

variable "project" {
  type        = string
  description = "(Required) The project ID to host the resource in"
}

variable "location" {
  type        = string
  description = "(Required) The region to host the resource in"
}