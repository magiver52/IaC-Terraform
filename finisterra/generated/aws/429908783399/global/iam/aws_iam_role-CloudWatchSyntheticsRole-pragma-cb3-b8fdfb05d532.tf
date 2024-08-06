locals {
  role_name_593c19c38b = "CloudWatchSyntheticsRole-pragma-cb3-b8fdfb05d532"
}

module "aws_iam_role-CloudWatchSyntheticsRole-pragma-cb3-b8fdfb05d532" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_593c19c38b
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  role_description     = "CloudWatch Synthetics lambda execution role for running canaries"
  max_session_duration = 3600
  path                 = "/service-role/"
  managed_policy_arns = {
    "CloudWatchSyntheticsPolicy-pragma-cb3-b8fdfb05d532" : module.aws_iam_policy-CloudWatchSyntheticsPolicy-pragma-cb3-b8fdfb05d532.arn
  }
}
