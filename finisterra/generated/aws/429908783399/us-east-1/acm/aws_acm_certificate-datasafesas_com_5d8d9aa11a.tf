locals {
  domain_name_5d8d9aa11a = "datasafesas.com"
}

module "aws_acm_certificate-datasafesas_com_5d8d9aa11a" {
  source      = "github.com/finisterra-io/terraform-aws-acm?ref=v1.0.1"
  domain_name = local.domain_name_5d8d9aa11a
  subject_alternative_names = [
    "*.${local.domain_name_5d8d9aa11a}",
    local.domain_name_5d8d9aa11a
  ]
  validation_method                           = "DNS"
  key_algorithm                               = "RSA_2048"
  certificate_transparency_logging_preference = "ENABLED"
}
