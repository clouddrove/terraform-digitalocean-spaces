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
variable "attributes" {
  type        = list(any)
  default     = []
  description = "Additional attributes (e.g. `1`)."
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

variable "cors_rule" {
  type = list(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = list(string)
    max_age_seconds = number
  }))
  default     = null
  description = "CORS Configuration specification for this bucket"
}

variable "prefix" {
  type        = string
  default     = null
  description = " (Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix."
}

variable "abort_incomplete_multipart_upload_days" {
  type        = number
  default     = null
  description = "Specifies the number of days after initiating a multipart upload when the multipart upload must be completed or else Spaces will abort the upload."
}

variable "date" {
  type        = string
  default     = null
  description = "pecifies the date/time after which you want applicable objects to expire. The argument uses RFC3339 format, e.g.(2020-03-22T15:03:55Z) or parts thereof e.g. 2019-02-28."
}

variable "expiration_days" {
  type        = number
  default     = null
  description = "Specifies the number of days after object creation when the applicable objects will expire."

}

variable "expired_object_delete_marker" {
  type        = string
  default     = ""
  description = "On a versioned bucket (versioning-enabled or versioning-suspended bucket), setting this to true directs Spaces to delete expired object delete markers."
}

variable "noncurrent_version_expiration" {
  type        = string
  default     = ""
  description = "On a versioned bucket (versioning-enabled or versioning-suspended bucket), setting this to true directs Spaces to delete expired object delete markers."
}