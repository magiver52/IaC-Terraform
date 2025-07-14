locals {
  name_72786b1863 = "/ecs/Nginx"
}

module "aws_cloudwatch_log_group-_ecs_Nginx" {
  source            = "github.com/finisterra-io/terraform-aws-cloudwatch//modules/log-group?ref=v1.0.1"
  name              = local.name_72786b1863
  retention_in_days = 0
}
