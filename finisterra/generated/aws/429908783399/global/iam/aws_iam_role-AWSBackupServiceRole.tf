locals {
  role_name_58f4beb3b8 = "AWSBackupServiceRole"
}

module "aws_iam_role-AWSBackupServiceRole" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_58f4beb3b8
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AssumeServiceRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "backup.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  role_description     = "Allows the AWS Backup Service to take scheduled backups"
  max_session_duration = 3600
  inline_policies = [
    {
      "name" : "iamplcy-pass-role",
      "policy" : "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"iam:PassRole\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::429908783399:role/*\",\"Sid\":\"PassRole\"}]}"
    }
  ]
  path = "/"
  managed_policy_arns = {
    "AWSBackupServiceRolePolicyForBackup" : "arn:${local.aws_partition}:iam::aws:policy/service-role/${local.role_name_58f4beb3b8}PolicyForBackup",
    "AWSBackupServiceRolePolicyForRestores" : "arn:${local.aws_partition}:iam::aws:policy/service-role/${local.role_name_58f4beb3b8}PolicyForRestores"
  }
}
