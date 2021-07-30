
provider "digitalocean" {
  # You need to set this in your .bashrc
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
  spaces_access_id  = "BI6Q4TQLWEMSLORURV43"
  spaces_secret_key = "nPTGaHrFxacVxc4m/SlnQxl7QvgZ9ZtY2FNUd6nYGQo"
}


module "spaces" {
  source = "./../"
  name          = "clouddrove"
  environment   = "test"
  label_order   = ["name"]
  acl           = "public-read"
  force_destroy = true
  region        = "nyc3"

}