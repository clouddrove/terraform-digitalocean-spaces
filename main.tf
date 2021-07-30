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
  source = "git::https://github.com/terraform-do-modules/terraform-digitalocean-labels.git?ref=0.15"
  #version     = "0.15.0"
  name        = var.name
  environment = var.environment
  label_order = var.label_order

}

#Module      : Spaces
#Description : Provides a bucket resource for Spaces, DigitalOcean's object storage product.

resource "digitalocean_spaces_bucket" "spaces" {
  name                  = var.name
  region                = var.region
  acl                   = var.acl
  force_destroy         = var.force_destroy

}

