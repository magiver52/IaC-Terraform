locals {
  security_group_name_2ef4e6e4db = "storagegateway-wizard 31474ebc"
}

module "aws_security_group-storagegateway-wizard_31474ebc_2ef4e6e4db" {
  source                     = "github.com/finisterra-io/terraform-aws-security-group?ref=817fa52ffb233f892f9323fe0b1de6cf22e158cc"
  security_group_name        = local.security_group_name_2ef4e6e4db
  vpc_id                     = "vpc-0b2ab00e7c6c5cecc"
  security_group_description = "Created by Storage Gateway create wizard"
  tags = {
    "Name" : "${local.security_group_name_2ef4e6e4db}",
    "storagegateway:wizard:date" : "2024-08-14T21:27:59.570Z",
    "storagegateway:wizard:id" : "31474ebc",
    "storagegateway:wizard:user" : "arn:${local.aws_partition}:iam::${local.aws_account_id}:root"
  }
  ingress_rules = {
    "sgr-030d6386210712cba" : {
      "cidr_ipv4" : "172.31.0.0/16",
      "description" : "SMB",
      "from_port" : 139,
      "ip_protocol" : "tcp",
      "to_port" : 139
    },
    "sgr-0397f9bed2131e148" : {
      "cidr_ipv4" : "172.31.0.0/16",
      "description" : "SMB",
      "from_port" : 139,
      "ip_protocol" : "udp",
      "to_port" : 139
    },
    "sgr-04ad10b0f24d69811" : {
      "cidr_ipv4" : "172.31.0.0/16",
      "description" : "SMB",
      "from_port" : 445,
      "ip_protocol" : "tcp",
      "to_port" : 445
    },
    "sgr-055365c3ea414923c" : {
      "cidr_ipv4" : "172.31.0.0/16",
      "description" : "NFS",
      "from_port" : 111,
      "ip_protocol" : "tcp",
      "to_port" : 111
    },
    "sgr-055808ae75db5bd70" : {
      "cidr_ipv4" : "172.31.0.0/16",
      "description" : "NFS",
      "from_port" : 111,
      "ip_protocol" : "udp",
      "to_port" : 111
    },
    "sgr-06d88c96bc84c8b98" : {
      "cidr_ipv4" : "172.31.0.0/16",
      "description" : "NFS",
      "from_port" : 2049,
      "ip_protocol" : "tcp",
      "to_port" : 2049
    },
    "sgr-08aa7b062a7e9b212" : {
      "cidr_ipv4" : "172.31.0.0/16",
      "description" : "NFS",
      "from_port" : 2049,
      "ip_protocol" : "udp",
      "to_port" : 2049
    },
    "sgr-090a95060034e4261" : {
      "cidr_ipv4" : "172.31.0.0/16",
      "description" : "NFS",
      "from_port" : 20048,
      "ip_protocol" : "tcp",
      "to_port" : 20048
    },
    "sgr-0d007245046d69c92" : {
      "cidr_ipv4" : "172.31.0.0/16",
      "description" : "NFS",
      "from_port" : 20048,
      "ip_protocol" : "udp",
      "to_port" : 20048
    }
  }
  egress_rules = {
    "sgr-05eb68a9727d9e60e" : {
      "cidr_ipv4" : "0.0.0.0/0",
      "description" : null,
      "ip_protocol" : "-1"
    }
  }
}
