
provider "digitalocean" {
  # You need to set this in your .bashrc
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
  spaces_access_id  = "ING6PR3ZYTSCEI2KHDBY"
  spaces_secret_key = "YuCbsjncTnDwUaBhsy1SUzMAW2eD6cTkaZqSamB1pvk"
}


module "spaces" {
  source        = "./../"
  name          = "clouddrove"
  environment   = "test"
  label_order   = ["name", "environment"]
  acl           = "public-read"
  force_destroy = true
  region        = "nyc3"

  cors_rule = [{
    "allowed_headers" : ["*"]
    allowed_methods = ["PUT", "POST"],
    allowed_origins = ["https://s3-website-test.hashicorp.com"],
    expose_headers  = ["ETag"],
  max_age_seconds = 3000 }]

  prefix                                 = true
  abort_incomplete_multipart_upload_days = "30"
  date                                   = "2021-09-06"
  expiration_days                        = "30"
  expired_object_delete_marker           = true
  noncurrent_version_expiration          = "30"

}

