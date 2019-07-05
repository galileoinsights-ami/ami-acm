variable "default_aws_tags" {
  description = "default aws tags"
  default = {}
}

variable "aws_resource_region" {
  description = "Region to use for creating the AWS resources"
}


variable "backend_s3_bucket_name" {
  description = "S3 bucket which contains remote state"
}

variable "primary_domain" {
  description = "primary domian to create the certificate for"
}