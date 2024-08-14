locals {
  bucket_eab62ec58e = "pruebacopi-a"
}

module "aws_s3_bucket-pruebacopi-a_eab62ec58e" {
  source               = "github.com/finisterra-io/terraform-aws-s3?ref=e9178c2b9250d466e55f9b9eceac96238986d7e0"
  attach_public_policy = true
  bucket               = local.bucket_eab62ec58e
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
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DelegateS3Access",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:${local.aws_partition}:iam::381492033636:role/S3MigrationRole"
      },
      "Action": [
        "s3:ListBucket",
        "s3:GetObject",
        "s3:GetObjectTagging",
        "s3:GetObjectVersion",
        "s3:GetObjectVersionTagging"
      ],
      "Resource": [
        "arn:${local.aws_partition}:s3:::${local.bucket_eab62ec58e}/*",
        "arn:${local.aws_partition}:s3:::${local.bucket_eab62ec58e}"
      ]
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
