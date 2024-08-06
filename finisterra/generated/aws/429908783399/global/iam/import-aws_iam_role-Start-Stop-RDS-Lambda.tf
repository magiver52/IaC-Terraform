import {
  id = "Start-Stop-RDS-Lambda"
  to = module.aws_iam_role-Start-Stop-RDS-Lambda.aws_iam_role.default[0]
}

import {
  id = "Start-Stop-RDS-Lambda/arn:aws:iam::429908783399:policy/Start-Stop-RDS"
  to = module.aws_iam_role-Start-Stop-RDS-Lambda.aws_iam_role_policy_attachment.managed["Start-Stop-RDS-Lambda_Start-Stop-RDS"]
}

import {
  id = "Start-Stop-RDS-Lambda/arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  to = module.aws_iam_role-Start-Stop-RDS-Lambda.aws_iam_role_policy_attachment.managed["Start-Stop-RDS-Lambda_AWSLambdaBasicExecutionRole"]
}

