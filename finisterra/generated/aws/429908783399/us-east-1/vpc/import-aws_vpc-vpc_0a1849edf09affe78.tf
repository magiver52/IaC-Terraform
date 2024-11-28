import {
  id = "vpc-0a1849edf09affe78"
  to = module.aws_vpc-vpc_0a1849edf09affe78.aws_vpc.this[0]
}

import {
  id = "vpc-0a1849edf09affe78"
  to = module.aws_vpc-vpc_0a1849edf09affe78.aws_default_route_table.default[0]
}

import {
  id = "acl-0c016f100b3132396"
  to = module.aws_vpc-vpc_0a1849edf09affe78.aws_default_network_acl.this[0]
}

import {
  id = "sg-0efe33f1b5947b9b0"
  to = module.aws_vpc-vpc_0a1849edf09affe78.aws_default_security_group.this[0]
}

import {
  id = "subnet-01a118aaf7445a891"
  to = module.aws_vpc-vpc_0a1849edf09affe78.aws_subnet.private["172.30.2.0/24"]
}

import {
  id = "subnet-0319bf260887bb8ca"
  to = module.aws_vpc-vpc_0a1849edf09affe78.aws_subnet.private["172.30.3.0/24"]
}

import {
  id = "subnet-048e7d93d0d3cb2e8"
  to = module.aws_vpc-vpc_0a1849edf09affe78.aws_subnet.private["172.30.1.0/24"]
}

import {
  id = "subnet-0629b5d96a5735c76"
  to = module.aws_vpc-vpc_0a1849edf09affe78.aws_subnet.private["172.30.0.0/24"]
}

import {
  id = "subnet-0c01688253718c851"
  to = module.aws_vpc-vpc_0a1849edf09affe78.aws_subnet.private["172.30.4.0/24"]
}

import {
  id = "subnet-0fb7023a4308bdf8b"
  to = module.aws_vpc-vpc_0a1849edf09affe78.aws_subnet.private["172.30.5.0/24"]
}

import {
  id = "igw-074996706b05ad6af"
  to = module.aws_vpc-vpc_0a1849edf09affe78.aws_internet_gateway.this[0]
}

import {
  id = "vpc-0a1849edf09affe78"
  to = module.aws_vpc-vpc_0a1849edf09affe78.aws_vpc_dhcp_options_association.this[0]
}

import {
  id = "dopt-09feaed0b7eca54e0"
  to = module.aws_vpc-vpc_0a1849edf09affe78.aws_vpc_dhcp_options.this[0]
}

