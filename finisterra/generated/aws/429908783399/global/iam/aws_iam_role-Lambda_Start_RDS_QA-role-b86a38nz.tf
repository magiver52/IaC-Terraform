locals {
  role_name_cfa2729319 = "Lambda_Start_RDS_QA-role-b86a38nz"
}

module "aws_iam_role-Lambda_Start_RDS_QA-role-b86a38nz" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_cfa2729319
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

  max_session_duration = 3600
  path                 = "/service-role/"
  managed_policy_arns = {
    "AWSLambdaBasicExecutionRole-7d7f76e7-7270-4ef3-8870-38fd6644ebc7" : module.aws_iam_policy-AWSLambdaBasicExecutionRole-7d7f76e7-7270-4ef3-8870-38fd6644ebc7.arn
  }
}
