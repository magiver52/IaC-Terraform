locals {
  domain_name_26afabbc6a = "datasafesas.com"
}

module "aws_acm_certificate-datasafesas_com_26afabbc6a" {
  source      = "github.com/finisterra-io/terraform-aws-acm?ref=d13fadc2a96fbe002aa867d2f0e2ca07433212f3"
  domain_name = local.domain_name_26afabbc6a
  subject_alternative_names = [
    local.domain_name_26afabbc6a,
    "www.${local.domain_name_26afabbc6a}"
  ]
  validation_method                           = "DNS"
  key_algorithm                               = "RSA_2048"
  certificate_transparency_logging_preference = "ENABLED"
}
