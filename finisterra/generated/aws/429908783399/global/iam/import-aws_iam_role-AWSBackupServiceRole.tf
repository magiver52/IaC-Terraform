import {
  id = "AWSBackupServiceRole"
  to = module.aws_iam_role-AWSBackupServiceRole.aws_iam_role.default[0]
}

import {
  id = "AWSBackupServiceRole/arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  to = module.aws_iam_role-AWSBackupServiceRole.aws_iam_role_policy_attachment.managed["AWSBackupServiceRole_AWSBackupServiceRolePolicyForBackup"]
}

import {
  id = "AWSBackupServiceRole/arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
  to = module.aws_iam_role-AWSBackupServiceRole.aws_iam_role_policy_attachment.managed["AWSBackupServiceRole_AWSBackupServiceRolePolicyForRestores"]
}

