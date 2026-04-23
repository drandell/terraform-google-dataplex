variable "entry_groups" {
  type = list(object({
    id           = string
    display_name = optional(string)
    description  = optional(string)
    location     = optional(string)
    project      = optional(string)
  }))
  description = "(Required) A list of entry group objects"
}

variable "project" {
  type        = string
  description = "(Optional) The default project ID to host the resource in"
}

variable "location" {
  type        = string
  description = "(Optional) The default location to host the resource in"
}
