locals {
  policy_name_eccd83822c = "CloudWatchSyntheticsPolicy-pragma-aa9-852576365dd7"
}

module "aws_iam_policy-CloudWatchSyntheticsPolicy-pragma-aa9-852576365dd7" {
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
        "arn:aws:s3:::cw-syn-results-429908783399-us-east-1/canary/us-east-1/pragma-aa9-852576365dd7/*"
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

  policy_name = local.policy_name_eccd83822c
  path        = "/service-role/"
}
