locals {
  bucket_f0d241f1ed = "linuxerosco"
}

module "aws_s3_bucket-linuxerosco_f0d241f1ed" {
  source               = "github.com/finisterra-io/terraform-aws-s3?ref=e9178c2b9250d466e55f9b9eceac96238986d7e0"
  attach_public_policy = true
  bucket               = local.bucket_f0d241f1ed
  object_lock_enabled  = false
  versioning = {
    "status" : "Enabled"
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
  "Version": "2008-10-17",
  "Id": "PolicyForCloudFrontPrivateContent",
  "Statement": [
    {
      "Sid": "AllowCloudFrontServicePrincipal",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudfront.amazonaws.com"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:${local.aws_partition}:s3:::${local.bucket_f0d241f1ed}/*",
      "Condition": {
        "StringEquals": {
          "AWS:SourceArn": "arn:${local.aws_partition}:cloudfront::${local.aws_account_id}:distribution/E86TF5AFSS4RU"
        }
      }
    }
  ]
}
EOF

  block_public_acls        = true
  block_public_policy      = true
  ignore_public_acls       = true
  restrict_public_buckets  = true
  control_object_ownership = true
  object_ownership         = "ObjectWriter"
}
