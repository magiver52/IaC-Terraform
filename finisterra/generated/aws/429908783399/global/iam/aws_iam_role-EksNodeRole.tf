locals {
  role_name_45e6b82ddf = "EksNodeRole"
}

module "aws_iam_role-EksNodeRole" {
  source             = "github.com/finisterra-io/terraform-aws-iam//modules/iam_role?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  role_name          = local.role_name_45e6b82ddf
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
    "AmazonEC2ContainerRegistryReadOnly" : "arn:${local.aws_partition}:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "AmazonEKSWorkerNodePolicy" : "arn:${local.aws_partition}:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "AmazonEKS_CNI_Policy" : "arn:${local.aws_partition}:iam::aws:policy/AmazonEKS_CNI_Policy",
    "AmazonEC2RoleforSSM" : "arn:${local.aws_partition}:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  }
  instance_profiles = [
    {
      "name" : "${local.role_name_45e6b82ddf}",
      "tags" : {}
    }
  ]
}
