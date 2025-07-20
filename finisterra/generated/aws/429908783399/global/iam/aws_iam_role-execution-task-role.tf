locals {
  role_name_033c44ccb1 = "execution-task-role"
}

module "aws_iam_role-execution-task-role" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=v1.0.2"
  role_name          = local.role_name_033c44ccb1
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  max_session_duration = 3600
  path                 = "/"
  tags = {
    "Name" : "prueba-iam-role"
  }
  managed_policy_arns = {
    "AmazonEC2ContainerServiceforEC2Role" : "arn:${local.aws_partition}:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  }
}
