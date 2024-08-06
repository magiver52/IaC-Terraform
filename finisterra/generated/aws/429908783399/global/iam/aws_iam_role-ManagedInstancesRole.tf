locals {
  role_name_0479ca1fac = "ManagedInstancesRole"
}

module "aws_iam_role-ManagedInstancesRole" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_0479ca1fac
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  role_description     = "Allows EC2 instances to call AWS services on your behalf."
  max_session_duration = 3600
  path                 = "/"
  managed_policy_arns = {
    "AmazonSSMManagedInstanceCore" : "arn:${local.aws_partition}:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "AmazonEC2ContainerServiceforEC2Role" : "arn:${local.aws_partition}:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role",
    "AmazonEC2RoleforSSM" : "arn:${local.aws_partition}:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
    "AmazonSSMMaintenanceWindowRole" : "arn:${local.aws_partition}:iam::aws:policy/service-role/AmazonSSMMaintenanceWindowRole"
  }
  instance_profiles = [
    {
      "name" : "${local.role_name_0479ca1fac}",
      "tags" : {}
    }
  ]
}
