
provider "digitalocean" {
  # You need to set this in your .bashrc
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
  spaces_access_id  = "xxxxxxxxxxx"
  spaces_secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxx"
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