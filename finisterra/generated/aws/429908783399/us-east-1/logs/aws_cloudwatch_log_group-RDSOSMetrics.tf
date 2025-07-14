locals {
  name_2a0bfffbd4 = "RDSOSMetrics"
}

module "aws_cloudwatch_log_group-RDSOSMetrics" {
  source            = "github.com/finisterra-io/terraform-aws-cloudwatch//modules/log-group?ref=v1.0.1"
  name              = local.name_2a0bfffbd4
  retention_in_days = 30
}
