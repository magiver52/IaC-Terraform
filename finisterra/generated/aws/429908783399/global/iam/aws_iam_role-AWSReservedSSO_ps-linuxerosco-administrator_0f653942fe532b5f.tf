locals {
  role_name_062ea38347 = "AWSReservedSSO_ps-linuxerosco-administrator_0f653942fe532b5f"
}

module "aws_iam_role-AWSReservedSSO_ps-linuxerosco-administrator_0f653942fe532b5f" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_062ea38347
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::429908783399:saml-provider/AWSSSO_a2053cb9d5e4d117_DO_NOT_DELETE"
      },
      "Action": [
        "sts:AssumeRoleWithSAML",
        "sts:TagSession"
      ],
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      }
    }
  ]
}
EOF

  role_description     = "Permission Set Administrator Access"
  max_session_duration = 43200
  path                 = "/aws-reserved/sso.amazonaws.com/"
  managed_policy_arns = {
    "AdministratorAccess" : "arn:${local.aws_partition}:iam::aws:policy/AdministratorAccess"
  }
}
