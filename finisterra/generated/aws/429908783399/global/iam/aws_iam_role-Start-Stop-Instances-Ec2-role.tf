locals {
  role_name_9bcd0439f8 = "Start-Stop-Instances-Ec2-role"
}

module "aws_iam_role-Start-Stop-Instances-Ec2-role" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_9bcd0439f8
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

  role_description     = "Allows Lambda functions to call AWS services on your behalf. - Permite en encender o apagar una instancia EC2"
  max_session_duration = 3600
  path                 = "/"
  managed_policy_arns = {
    "Start-Stop-InstancesEc2" : module.aws_iam_policy-Start-Stop-InstancesEc2.arn,
    "AWSLambdaBasicExecutionRole" : "arn:${local.aws_partition}:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  }
}
