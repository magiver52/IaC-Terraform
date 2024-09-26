locals {
  role_name_57890c308b = "rds-monitoring-role"
}

module "aws_iam_role-rds-monitoring-role" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_57890c308b
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "monitoring.rds.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  max_session_duration = 3600
  path                 = "/"
  managed_policy_arns = {
    "AmazonRDSEnhancedMonitoringRole" : "arn:${local.aws_partition}:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  }
}