## Managed By : CloudDrove
##Description : This Script is used to create VPC.
## Copyright @ CloudDrove. All Right Reserved.

# locals for regions
locals {
  region = {
    amsterdam-2 = "ams2"
    amsterdam-3 = "ams3"
    bangalore-1 = "blr1"
    frankfurt-1 = "fra1"
    london-1    = "lon-1"
    newyork-1   = "nyc1"
    newyork-2   = "nyc2"
    newyork-3   = "nyc3"
    francisco-1 = "sfo1"
    singapore-1 = "sgp1"
    toronto-1   = "tor1"
  }
}

#Module      : LABEL
#Description : Terraform label module variables.
module "labels" {
  source = ""
  version     = "0.15.0"
  name        = var.name
  environment = var.environment
  label_order = var.label_order
  attributes  = var.attributes


}

#Module      : Spaces
#Description : Provides a bucket resource for Spaces, DigitalOcean's object storage product.

resource "digitalocean_spaces_bucket" "spaces" {
  name   = module.labels.id
  region = var.region
  acl    = var.acl

  force_destroy = var.force_destroy

  dynamic "cors_rule" {
    for_each = var.cors_rule == null ? [] : var.cors_rule

    content {
      allowed_headers = cors_rule.value.allowed_headers
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }

  lifecycle_rule {
    enabled = false
    prefix  = var.prefix

    abort_incomplete_multipart_upload_days = var.abort_incomplete_multipart_upload_days
    expiration {
      date = var.date
      days = var.expiration_days

      expired_object_delete_marker = var.expired_object_delete_marker
    }
    noncurrent_version_expiration {
      days = var.noncurrent_version_expiration
    }
  }
  versioning {
    enabled = var.versioning
  }

}