locals {
  policy_name_ae15e2fd38 = "AWSLambdaBasicExecutionRole-7d7f76e7-7270-4ef3-8870-38fd6644ebc7"
}

module "aws_iam_policy-AWSLambdaBasicExecutionRole-7d7f76e7-7270-4ef3-8870-38fd6644ebc7" {
  source           = "github.com/finisterra-io/terraform-aws-iam//modules/iam_policy?ref=v1.0.2"
  policy_documents = <<EOF
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:us-east-1:429908783399:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:us-east-1:429908783399:log-group:/aws/lambda/Lambda_Start_RDS_QA:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
EOF

  policy_name = local.policy_name_ae15e2fd38
  path        = "/service-role/"
}
