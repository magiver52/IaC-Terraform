locals {
  role_name_e69c101537 = "ft-ro-gha-cicd-role"
}

module "aws_iam_role-ft-ro-gha-cicd-role" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_e69c101537
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::429908783399:oidc-provider/token.actions.githubusercontent.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
        },
        "StringLike": {
          "token.actions.githubusercontent.com:sub": "repo:magiver52/*:*"
        }
      }
    }
  ]
}
EOF

  max_session_duration = 3600
  inline_policies = [
    {
      "name" : "TerraformStateLockPolicy",
      "policy" : "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"dynamodb:GetItem\",\"dynamodb:PutItem\",\"dynamodb:DeleteItem\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:dynamodb:*:429908783399:table/*tfstate-lock*\"},{\"Action\":[\"s3:GetObject\",\"s3:PutObject\",\"s3:DeleteObject\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::*ft-429908783399-*tfstate/*\"}]}"
    }
  ]
  path = "/"
  managed_policy_arns = {
    "ReadOnlyAccess" : "arn:${local.aws_partition}:iam::aws:policy/ReadOnlyAccess"
  }
}
