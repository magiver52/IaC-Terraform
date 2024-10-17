locals {
  role_name_ff7357e51c = "StorageGatewayBucketAccessRole17236718550570.10911149021244237"
}

module "aws_iam_role-StorageGatewayBucketAccessRole17236718550570_10911149021244237" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_ff7357e51c
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "storagegateway.amazonaws.com"
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "aws:SourceAccount": "429908783399",
          "aws:SourceArn": "arn:aws:storagegateway:us-east-1:429908783399:gateway/sgw-3255E45B"
        }
      }
    }
  ]
}
EOF

  max_session_duration = 3600
  path                 = "/service-role/"
  managed_policy_arns = {
    "AllowStorageGatewayAssumeBucketAccessRole17236718550570.9306023719267222" : module.aws_iam_policy-AllowStorageGatewayAssumeBucketAccessRole17236718550570_9306023719267222.arn
  }
}
