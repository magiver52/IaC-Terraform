import {
  id = "ManagedInstancesRole"
  to = module.aws_iam_role-ManagedInstancesRole.aws_iam_role.default[0]
}

import {
  id = "ManagedInstancesRole/arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  to = module.aws_iam_role-ManagedInstancesRole.aws_iam_role_policy_attachment.managed["ManagedInstancesRole_AmazonSSMManagedInstanceCore"]
}

import {
  id = "ManagedInstancesRole/arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  to = module.aws_iam_role-ManagedInstancesRole.aws_iam_role_policy_attachment.managed["ManagedInstancesRole_AmazonEC2ContainerServiceforEC2Role"]
}

import {
  id = "ManagedInstancesRole/arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  to = module.aws_iam_role-ManagedInstancesRole.aws_iam_role_policy_attachment.managed["ManagedInstancesRole_AmazonEC2RoleforSSM"]
}

import {
  id = "ManagedInstancesRole/arn:aws:iam::aws:policy/service-role/AmazonSSMMaintenanceWindowRole"
  to = module.aws_iam_role-ManagedInstancesRole.aws_iam_role_policy_attachment.managed["ManagedInstancesRole_AmazonSSMMaintenanceWindowRole"]
}

import {
  id = "ManagedInstancesRole"
  to = module.aws_iam_role-ManagedInstancesRole.aws_iam_instance_profile.default["ManagedInstancesRole"]
}

