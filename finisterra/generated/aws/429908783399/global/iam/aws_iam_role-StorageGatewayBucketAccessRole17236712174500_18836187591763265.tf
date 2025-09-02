locals {
  role_name_e37e1570dd = "StorageGatewayBucketAccessRole17236712174500.18836187591763265"
}

module "aws_iam_role-StorageGatewayBucketAccessRole17236712174500_18836187591763265" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_e37e1570dd
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
          "aws:SourceArn": "arn:aws:storagegateway:us-east-1:429908783399:gateway/sgw-3255E45B",
          "aws:SourceAccount": "429908783399"
        }
      }
    }
  ]
}
EOF

  max_session_duration = 3600
  path                 = "/service-role/"
  managed_policy_arns = {
    "AllowStorageGatewayAssumeBucketAccessRole17236712174500.792363289636349" : module.aws_iam_policy-AllowStorageGatewayAssumeBucketAccessRole17236712174500_792363289636349.arn
  }
}
