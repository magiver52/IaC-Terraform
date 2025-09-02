import {
  id = "ecsInstanceRole"
  to = module.aws_iam_role-ecsInstanceRole.aws_iam_role.default[0]
}

import {
  id = "ecsInstanceRole/arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  to = module.aws_iam_role-ecsInstanceRole.aws_iam_role_policy_attachment.managed["ecsInstanceRole_AmazonSSMManagedInstanceCore"]
}

import {
  id = "ecsInstanceRole/arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  to = module.aws_iam_role-ecsInstanceRole.aws_iam_role_policy_attachment.managed["ecsInstanceRole_AmazonEC2ContainerServiceforEC2Role"]
}

import {
  id = "ecsInstanceRole"
  to = module.aws_iam_role-ecsInstanceRole.aws_iam_instance_profile.default["ecsInstanceRole"]
}

