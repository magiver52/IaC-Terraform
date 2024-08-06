module "aws_vpc-vpc_0a1849edf09affe78" {
  source                               = "github.com/finisterra-io/terraform-aws-vpc?ref=ef07112789b82d07e3d409fdffea81082b874d86"
  create_igw                           = true
  cidr                                 = "172.30.0.0/16"
  instance_tenancy                     = "default"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  manage_default_route_table           = true
  default_route_table_routes = [
    {
      "cidr_block" : "0.0.0.0/0",
      "gateway_id" : "igw-074996706b05ad6af"
    }
  ]
  manage_default_network_acl = true
  default_network_acl_egress = [
    {
      "action" : "allow",
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "icmp_code" : "0",
      "icmp_type" : "0",
      "protocol" : "-1",
      "rule_no" : 100,
      "to_port" : 0
    }
  ]
  default_network_acl_ingress = [
    {
      "action" : "allow",
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "icmp_code" : "0",
      "icmp_type" : "0",
      "protocol" : "-1",
      "rule_no" : 100,
      "to_port" : 0
    }
  ]
  manage_default_security_group = true
  default_security_group_egress = [
    {
      "cidr_blocks" : "0.0.0.0/0",
      "description" : "",
      "from_port" : 0,
      "ipv6_cidr_blocks" : "",
      "prefix_list_ids" : "",
      "protocol" : "-1",
      "security_groups" : "",
      "self" : false,
      "to_port" : 0
    }
  ]
  default_security_group_ingress = [
    {
      "cidr_blocks" : "",
      "description" : "",
      "from_port" : 0,
      "ipv6_cidr_blocks" : "",
      "prefix_list_ids" : "",
      "protocol" : "-1",
      "security_groups" : "",
      "self" : true,
      "to_port" : 0
    }
  ]
  private_subnets = {
    "172.30.2.0/24" : {
      "az" : "${local.aws_region}c",
      "ipv6_cidr_block" : "",
      "tags" : {},
      "route_tables" : [],
      "assign_ipv6_address_on_creation" : false,
      "enable_dns64" : false,
      "enable_resource_name_dns_aaaa_record_on_launch" : false,
      "enable_resource_name_dns_a_record_on_launch" : false,
      "ipv6_native" : false,
      "private_dns_hostname_type_on_launch" : "ip-name",
      "map_public_ip_on_launch" : true
    },
    "172.30.3.0/24" : {
      "az" : "${local.aws_region}d",
      "ipv6_cidr_block" : "",
      "tags" : {},
      "route_tables" : [],
      "assign_ipv6_address_on_creation" : false,
      "enable_dns64" : false,
      "enable_resource_name_dns_aaaa_record_on_launch" : false,
      "enable_resource_name_dns_a_record_on_launch" : false,
      "ipv6_native" : false,
      "private_dns_hostname_type_on_launch" : "ip-name",
      "map_public_ip_on_launch" : true
    },
    "172.30.1.0/24" : {
      "az" : "${local.aws_region}b",
      "ipv6_cidr_block" : "",
      "tags" : {},
      "route_tables" : [],
      "assign_ipv6_address_on_creation" : false,
      "enable_dns64" : false,
      "enable_resource_name_dns_aaaa_record_on_launch" : false,
      "enable_resource_name_dns_a_record_on_launch" : false,
      "ipv6_native" : false,
      "private_dns_hostname_type_on_launch" : "ip-name",
      "map_public_ip_on_launch" : true
    },
    "172.30.0.0/24" : {
      "az" : "${local.aws_region}a",
      "ipv6_cidr_block" : "",
      "tags" : {},
      "route_tables" : [],
      "assign_ipv6_address_on_creation" : false,
      "enable_dns64" : false,
      "enable_resource_name_dns_aaaa_record_on_launch" : false,
      "enable_resource_name_dns_a_record_on_launch" : false,
      "ipv6_native" : false,
      "private_dns_hostname_type_on_launch" : "ip-name",
      "map_public_ip_on_launch" : true
    },
    "172.30.4.0/24" : {
      "az" : "${local.aws_region}e",
      "ipv6_cidr_block" : "",
      "tags" : {},
      "route_tables" : [],
      "assign_ipv6_address_on_creation" : false,
      "enable_dns64" : false,
      "enable_resource_name_dns_aaaa_record_on_launch" : false,
      "enable_resource_name_dns_a_record_on_launch" : false,
      "ipv6_native" : false,
      "private_dns_hostname_type_on_launch" : "ip-name",
      "map_public_ip_on_launch" : true
    },
    "172.30.5.0/24" : {
      "az" : "${local.aws_region}f",
      "ipv6_cidr_block" : "",
      "tags" : {},
      "route_tables" : [],
      "assign_ipv6_address_on_creation" : false,
      "enable_dns64" : false,
      "enable_resource_name_dns_aaaa_record_on_launch" : false,
      "enable_resource_name_dns_a_record_on_launch" : false,
      "ipv6_native" : false,
      "private_dns_hostname_type_on_launch" : "ip-name",
      "map_public_ip_on_launch" : true
    }
  }
  enable_dhcp_options_association = true
  dhcp_options_id                 = "dopt-09feaed0b7eca54e0"
  create_dhcp_options             = true
  dhcp_options_domain_name        = "ec2.internal"
  dhcp_options_domain_name_servers = [
    "AmazonProvidedDNS"
  ]
}
