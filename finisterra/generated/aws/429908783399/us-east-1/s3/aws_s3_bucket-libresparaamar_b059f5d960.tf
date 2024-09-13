locals {
  bucket_b059f5d960 = "libresparaamar"
}

module "aws_s3_bucket-libresparaamar_b059f5d960" {
  source               = "github.com/finisterra-io/terraform-aws-s3?ref=3830866c9239fc1b40905ef58f0513053afc48eb"
  attach_public_policy = true
  bucket               = local.bucket_b059f5d960
  object_lock_enabled  = false
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
      "Resource": "arn:${local.aws_partition}:s3:::${local.bucket_b059f5d960}/*",
      "Condition": {
        "StringEquals": {
          "AWS:SourceArn": "arn:${local.aws_partition}:cloudfront::${local.aws_account_id}:distribution/EBZTBSGAURWRM"
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
