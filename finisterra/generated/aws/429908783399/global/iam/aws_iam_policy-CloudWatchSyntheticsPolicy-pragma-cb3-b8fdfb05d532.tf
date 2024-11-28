locals {
  policy_name_bb6e140b2c = "CloudWatchSyntheticsPolicy-pragma-cb3-b8fdfb05d532"
}

module "aws_iam_policy-CloudWatchSyntheticsPolicy-pragma-cb3-b8fdfb05d532" {
  source           = "github.com/finisterra-io/terraform-aws-iam//modules/iam_policy?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  policy_documents = <<EOF
{
  "Statement": [
    {
      "Action": [
        "s3:PutObject",
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::cw-syn-results-429908783399-us-east-1/canary/us-east-1/pragma-cb3-b8fdfb05d532/*"
      ]
    },
    {
      "Action": [
        "s3:GetBucketLocation"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::cw-syn-results-429908783399-us-east-1"
      ]
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:CreateLogGroup"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:us-east-1:429908783399:log-group:/aws/lambda/cwsyn-pragma-*"
      ]
    },
    {
      "Action": [
        "s3:ListAllMyBuckets",
        "xray:PutTraceSegments"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ]
    },
    {
      "Action": "cloudwatch:PutMetricData",
      "Condition": {
        "StringEquals": {
          "cloudwatch:namespace": "CloudWatchSynthetics"
        }
      },
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
EOF

  policy_name = local.policy_name_bb6e140b2c
  path        = "/service-role/"
}
