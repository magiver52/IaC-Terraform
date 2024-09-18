locals {
  bucket_6cc18f1e39 = "cw-syn-results-${local.aws_account_id}-${local.aws_region}"
}

module "aws_s3_bucket-cw-syn-results-429908783399-us-east-1_6cc18f1e39" {
  source               = "github.com/finisterra-io/terraform-aws-s3?ref=1ee6ae1cc36f65164d4a37a6fbaa1ea6c8d7772d"
  attach_public_policy = true
  bucket               = local.bucket_6cc18f1e39
  object_lock_enabled  = false
  server_side_encryption_configuration = {
    "rule" : {
      "apply_server_side_encryption_by_default" : {
        "kms_master_key_id" : "",
        "sse_algorithm" : "aws:kms"
      },
      "bucket_key_enabled" : false
    }
  }
  request_payer            = "BucketOwner"
  block_public_acls        = true
  block_public_policy      = true
  ignore_public_acls       = true
  restrict_public_buckets  = true
  control_object_ownership = true
  object_ownership         = "BucketOwnerEnforced"
}
