variable "project" {
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
