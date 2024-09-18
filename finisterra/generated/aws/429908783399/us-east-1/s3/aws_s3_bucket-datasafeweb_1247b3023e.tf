locals {
  bucket_1247b3023e = "datasafeweb"
}

module "aws_s3_bucket-datasafeweb_1247b3023e" {
  source               = "github.com/finisterra-io/terraform-aws-s3?ref=1ee6ae1cc36f65164d4a37a6fbaa1ea6c8d7772d"
  attach_public_policy = true
  bucket               = local.bucket_1247b3023e
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
      "Resource": "arn:${local.aws_partition}:s3:::${local.bucket_1247b3023e}/*",
      "Condition": {
        "StringEquals": {
          "AWS:SourceArn": "arn:${local.aws_partition}:cloudfront::${local.aws_account_id}:distribution/E1E6KEH9E0SQL8"
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
