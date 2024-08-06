import {
  id = "iam_logging_lambda"
  to = module.aws_iam_role-iam_logging_lambda.aws_iam_role.default[0]
}

import {
  id = "iam_logging_lambda/arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  to = module.aws_iam_role-iam_logging_lambda.aws_iam_role_policy_attachment.managed["iam_logging_lambda_AWSLambdaBasicExecutionRole"]
}

import {
  id = "iam_logging_lambda/arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  to = module.aws_iam_role-iam_logging_lambda.aws_iam_role_policy_attachment.managed["iam_logging_lambda_AWSLambdaVPCAccessExecutionRole"]
}

