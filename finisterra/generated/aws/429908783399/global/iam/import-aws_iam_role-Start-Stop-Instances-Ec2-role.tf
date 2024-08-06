import {
  id = "Start-Stop-Instances-Ec2-role"
  to = module.aws_iam_role-Start-Stop-Instances-Ec2-role.aws_iam_role.default[0]
}

import {
  id = "Start-Stop-Instances-Ec2-role/arn:aws:iam::429908783399:policy/Start-Stop-InstancesEc2"
  to = module.aws_iam_role-Start-Stop-Instances-Ec2-role.aws_iam_role_policy_attachment.managed["Start-Stop-Instances-Ec2-role_Start-Stop-InstancesEc2"]
}

import {
  id = "Start-Stop-Instances-Ec2-role/arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  to = module.aws_iam_role-Start-Stop-Instances-Ec2-role.aws_iam_role_policy_attachment.managed["Start-Stop-Instances-Ec2-role_AWSLambdaBasicExecutionRole"]
}

