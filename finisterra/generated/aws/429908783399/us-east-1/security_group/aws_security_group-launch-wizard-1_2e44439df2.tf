locals {
  security_group_name_2e44439df2 = "launch-wizard-1"
}

module "aws_security_group-launch-wizard-1_2e44439df2" {
  source                     = "github.com/finisterra-io/terraform-aws-security-group?ref=817fa52ffb233f892f9323fe0b1de6cf22e158cc"
  security_group_name        = local.security_group_name_2e44439df2
  vpc_id                     = "vpc-0b2ab00e7c6c5cecc"
  security_group_description = "${local.security_group_name_2e44439df2} created 2024-08-14T22:02:47.690Z"
  ingress_rules = {
    "sgr-049bcfd112cd8c30e" : {
      "cidr_ipv4" : "0.0.0.0/0",
      "description" : null,
      "from_port" : 22,
      "ip_protocol" : "tcp",
      "to_port" : 22
    }
  }
  egress_rules = {
    "sgr-00914d60018061a82" : {
      "cidr_ipv4" : "0.0.0.0/0",
      "description" : null,
      "ip_protocol" : "-1"
    }
  }
}
