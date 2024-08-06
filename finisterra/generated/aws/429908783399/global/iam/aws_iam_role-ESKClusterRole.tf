locals {
  role_name_0cafda4cce = "ESKClusterRole"
}

module "aws_iam_role-ESKClusterRole" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_0cafda4cce
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  role_description     = "Allows access to other AWS service resources that are required to operate clusters managed by EKS."
  max_session_duration = 3600
  path                 = "/"
  managed_policy_arns = {
    "AmazonEKSClusterPolicy" : "arn:${local.aws_partition}:iam::aws:policy/AmazonEKSClusterPolicy"
  }
}
