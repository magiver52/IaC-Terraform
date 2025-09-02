import {
  id = "rds-monitoring-role"
  to = module.aws_iam_role-rds-monitoring-role.aws_iam_role.default[0]
}

import {
  id = "rds-monitoring-role/arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  to = module.aws_iam_role-rds-monitoring-role.aws_iam_role_policy_attachment.managed["rds-monitoring-role_AmazonRDSEnhancedMonitoringRole"]
}

