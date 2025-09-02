import {
  id = "ESKClusterRole"
  to = module.aws_iam_role-ESKClusterRole.aws_iam_role.default[0]
}

import {
  id = "ESKClusterRole/arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  to = module.aws_iam_role-ESKClusterRole.aws_iam_role_policy_attachment.managed["ESKClusterRole_AmazonEKSClusterPolicy"]
}

