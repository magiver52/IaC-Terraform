locals {
  policy_name_3871bdb311 = "Start-Stop-InstancesEc2"
}

module "aws_iam_policy-Start-Stop-InstancesEc2" {
  source           = "github.com/finisterra-io/terraform-aws-iam//modules/iam_policy?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  policy_documents = <<EOF
{
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:logs:*:*:*"
    },
    {
      "Action": [
        "ec2:Start*",
        "ec2:Stop*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
EOF

  policy_name = local.policy_name_3871bdb311
  path        = "/"
}
