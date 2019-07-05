# Backend Initialization using command line

terraform {
 backend "s3" {
   key = "acm.tfstate"
 }
}

locals {

}

# Initializing the provider

# Following properties need to be set for this to work
# export AWS_ACCESS_KEY_ID="anaccesskey"
# export AWS_SECRET_ACCESS_KEY="asecretkey"
# export AWS_DEFAULT_REGION="us-west-2"
# terraform plan
provider "aws" {
  # not using the lates version becauce there is a bug with the latest
  # version. See https://github.com/terraform-providers/terraform-provider-aws/issues/7918
  version = "v1.60.0"

  region  = "${var.aws_resource_region}"
}


data "aws_route53_zone" "primary_domain" {
  name = "${var.primary_domain}"
}


module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "v1.2.0"

  domain_name  = "${var.primary_domain}"
  zone_id      = "${data.aws_route53_zone.primary_domain.zone_id}"

  subject_alternative_names = [
    "*.${var.primary_domain}",
  ]

  wait_for_validation = false
  tags = {
    "Name"="v1-${var.primary_domain}"
  }
}
