import {
  id = "Lambda_Start_RDS_QA-role-b86a38nz"
  to = module.aws_iam_role-Lambda_Start_RDS_QA-role-b86a38nz.aws_iam_role.default[0]
}

import {
  id = "Lambda_Start_RDS_QA-role-b86a38nz/arn:aws:iam::429908783399:policy/service-role/AWSLambdaBasicExecutionRole-7d7f76e7-7270-4ef3-8870-38fd6644ebc7"
  to = module.aws_iam_role-Lambda_Start_RDS_QA-role-b86a38nz.aws_iam_role_policy_attachment.managed["Lambda_Start_RDS_QA-role-b86a38nz_AWSLambdaBasicExecutionRole-7d7f76e7-7270-4ef3-8870-38fd6644ebc7"]
}

