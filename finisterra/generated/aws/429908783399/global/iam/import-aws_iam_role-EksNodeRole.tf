import {
  id = "EksNodeRole"
  to = module.aws_iam_role-EksNodeRole.aws_iam_role.default[0]
}

import {
  id = "EksNodeRole/arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  to = module.aws_iam_role-EksNodeRole.aws_iam_role_policy_attachment.managed["EksNodeRole_AmazonEC2ContainerRegistryReadOnly"]
}

import {
  id = "EksNodeRole/arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  to = module.aws_iam_role-EksNodeRole.aws_iam_role_policy_attachment.managed["EksNodeRole_AmazonEKSWorkerNodePolicy"]
}

import {
  id = "EksNodeRole/arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  to = module.aws_iam_role-EksNodeRole.aws_iam_role_policy_attachment.managed["EksNodeRole_AmazonEKS_CNI_Policy"]
}

import {
  id = "EksNodeRole/arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  to = module.aws_iam_role-EksNodeRole.aws_iam_role_policy_attachment.managed["EksNodeRole_AmazonEC2RoleforSSM"]
}

import {
  id = "EksNodeRole"
  to = module.aws_iam_role-EksNodeRole.aws_iam_instance_profile.default["EksNodeRole"]
}

