#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `organization`, `environment`, `name` and `attributes`."
}


variable "region" {
  type        = string
  default     = ""
  description = "The region to create VPC, like ``london-1`` , ``bangalore-1`` ,``newyork-3`` ``toronto-1``. "
}

#Module      : spaces
#Description : Provides a bucket resource for Spaces, DigitalOcean's object storage product.


variable "acl" {
  type        = string
  default     = null
  description = "Canned ACL applied on bucket creation (private or public-read)."
}

variable "versioning" {
  type        = bool
  default     = true
  description = "(Optional) A state of versioning (documented below)."
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Unless true, the bucket will only be destroyed if empty (Defaults to false)."
}
