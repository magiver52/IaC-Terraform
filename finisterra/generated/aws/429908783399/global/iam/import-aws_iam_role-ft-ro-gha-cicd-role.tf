import {
  id = "ft-ro-gha-cicd-role"
  to = module.aws_iam_role-ft-ro-gha-cicd-role.aws_iam_role.default[0]
}

import {
  id = "ft-ro-gha-cicd-role/arn:aws:iam::aws:policy/ReadOnlyAccess"
  to = module.aws_iam_role-ft-ro-gha-cicd-role.aws_iam_role_policy_attachment.managed["ft-ro-gha-cicd-role_ReadOnlyAccess"]
}

