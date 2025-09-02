locals {
  name_2a0bfffbd4 = "RDSOSMetrics"
}

module "aws_cloudwatch_log_group-RDSOSMetrics" {
  source            = "github.com/finisterra-io/terraform-aws-cloudwatch//modules/log-group?ref=b7a17fd8594b7506cae986aff39b5d16c0123c36"
  name              = local.name_2a0bfffbd4
  retention_in_days = 30
}
