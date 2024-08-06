locals {
  bucket_a2dc0c6d3f = "linuxeroscopi"
}

module "aws_s3_bucket-linuxeroscopi_a2dc0c6d3f" {
  source               = "github.com/finisterra-io/terraform-aws-s3?ref=e9178c2b9250d466e55f9b9eceac96238986d7e0"
  attach_public_policy = true
  bucket               = local.bucket_a2dc0c6d3f
  object_lock_enabled  = false
  website = {
    "index_document" : "index.html"
  }
  server_side_encryption_configuration = {
    "rule" : {
      "apply_server_side_encryption_by_default" : {
        "kms_master_key_id" : "",
        "sse_algorithm" : "AES256"
      },
      "bucket_key_enabled" : true
    }
  }
  request_payer = "BucketOwner"
  attach_policy = true
  policy        = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:${local.aws_partition}:s3:::${local.bucket_a2dc0c6d3f}/*"
    }
  ]
}
EOF

  block_public_acls        = false
  block_public_policy      = false
  ignore_public_acls       = false
  restrict_public_buckets  = false
  control_object_ownership = true
  object_ownership         = "BucketOwnerEnforced"
}
