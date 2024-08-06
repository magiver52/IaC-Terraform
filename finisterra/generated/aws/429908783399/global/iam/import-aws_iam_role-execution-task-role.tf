import {
  id = "execution-task-role"
  to = module.aws_iam_role-execution-task-role.aws_iam_role.default[0]
}

import {
  id = "execution-task-role/arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  to = module.aws_iam_role-execution-task-role.aws_iam_role_policy_attachment.managed["execution-task-role_AmazonEC2ContainerServiceforEC2Role"]
}

