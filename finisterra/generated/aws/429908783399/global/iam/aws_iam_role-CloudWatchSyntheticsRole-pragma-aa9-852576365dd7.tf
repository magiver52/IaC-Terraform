locals {
  role_name_65175d92e3 = "CloudWatchSyntheticsRole-pragma-aa9-852576365dd7"
}

module "aws_iam_role-CloudWatchSyntheticsRole-pragma-aa9-852576365dd7" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_65175d92e3
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
    "CloudWatchSyntheticsPolicy-pragma-aa9-852576365dd7" : module.aws_iam_policy-CloudWatchSyntheticsPolicy-pragma-aa9-852576365dd7.arn
  }
}
