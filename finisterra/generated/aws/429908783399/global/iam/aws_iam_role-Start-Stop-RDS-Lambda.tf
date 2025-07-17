locals {
  role_name_1775ea3327 = "Start-Stop-RDS-Lambda"
}

module "aws_iam_role-Start-Stop-RDS-Lambda" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_1775ea3327
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

  role_description     = "Allows Lambda functions to call AWS services on your behalf."
  max_session_duration = 3600
  path                 = "/"
  managed_policy_arns = {
    "Start-Stop-RDS" : module.aws_iam_policy-Start-Stop-RDS.arn,
    "AWSLambdaBasicExecutionRole" : "arn:${local.aws_partition}:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  }
}
