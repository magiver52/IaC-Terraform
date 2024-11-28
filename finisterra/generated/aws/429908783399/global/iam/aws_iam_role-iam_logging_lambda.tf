locals {
  role_name_a9ede8fbf4 = "iam_logging_lambda"
}

module "aws_iam_role-iam_logging_lambda" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_a9ede8fbf4
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  max_session_duration = 3600
  path                 = "/"
  managed_policy_arns = {
    "AWSLambdaBasicExecutionRole" : "arn:${local.aws_partition}:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
    "AWSLambdaVPCAccessExecutionRole" : "arn:${local.aws_partition}:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  }
}
