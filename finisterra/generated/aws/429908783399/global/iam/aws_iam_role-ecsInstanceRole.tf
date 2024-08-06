locals {
  role_name_cb3dd02a47 = "ecsInstanceRole"
}

module "aws_iam_role-ecsInstanceRole" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_cb3dd02a47
  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  max_session_duration = 3600
  path                 = "/"
  managed_policy_arns = {
    "AmazonSSMManagedInstanceCore" : "arn:${local.aws_partition}:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "AmazonEC2ContainerServiceforEC2Role" : "arn:${local.aws_partition}:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  }
  instance_profiles = [
    {
      "name" : "${local.role_name_cb3dd02a47}",
      "tags" : {}
    }
  ]
}
