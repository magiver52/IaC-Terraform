locals {
  bucket_999501159e = "sgw-2024-08-14-vcpmu"
}

module "aws_s3_bucket-sgw-2024-08-14-vcpmu_999501159e" {
  source               = "github.com/finisterra-io/terraform-aws-s3?ref=1ee6ae1cc36f65164d4a37a6fbaa1ea6c8d7772d"
  attach_public_policy = true
  bucket               = local.bucket_999501159e
  object_lock_enabled  = false
  server_side_encryption_configuration = {
    "rule" : {
      "apply_server_side_encryption_by_default" : {
        "kms_master_key_id" : "",
        "sse_algorithm" : "AES256"
      },
      "bucket_key_enabled" : false
    }
  }
  request_payer = "BucketOwner"
  attach_policy = true
  policy        = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
        "arn:${local.aws_partition}:s3:::${local.bucket_999501159e}/*",
        "arn:${local.aws_partition}:s3:::${local.bucket_999501159e}"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
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
  object_ownership         = "BucketOwnerEnforced"
}
