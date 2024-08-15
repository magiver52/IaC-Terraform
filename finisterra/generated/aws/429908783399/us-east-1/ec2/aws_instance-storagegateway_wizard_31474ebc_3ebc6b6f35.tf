module "aws_instance-storagegateway_wizard_31474ebc_3ebc6b6f35" {
  source                               = "github.com/finisterra-io/terraform-aws-ec2?ref=bc5bcc8defbe1a140ef083071b2d72d78d4ae79d"
  ami                                  = "ami-0f5e812a29f63dcd3"
  availability_zone                    = "${local.aws_region}a"
  instance_type                        = "m5.xlarge"
  ebs_optimized                        = false
  disable_api_termination              = false
  instance_initiated_shutdown_behavior = "stop"
  associate_public_ip_address          = true
  ssh_key_pair                         = module.aws_key_pair-LinuxerosCO_01_776977b626.id
  subnet_id                            = "subnet-03f80b31fda4bb0db"
  monitoring                           = false
  source_dest_check                    = true
  ipv6_address_count                   = 0
  tenancy                              = "default"
  security_groups = [
    module.aws_security_group-storagegateway-wizard_31474ebc_2ef4e6e4db.id
  ]
  root_block_device = {
    "delete_on_termination" : true,
    "encrypted" : false,
    "tags" : {
      "Name" : "storagegateway-wizard 31474ebc",
      "storagegateway:wizard:date" : "2024-08-14T21:27:59.570Z",
      "storagegateway:wizard:id" : "31474ebc",
      "storagegateway:wizard:user" : "arn:${local.aws_partition}:iam::${local.aws_account_id}:root"
    },
    "throughput" : 125,
    "volume_size" : 80,
    "volume_type" : "gp3"
  }
  metadata_options = {
    "http_endpoint" : "enabled",
    "http_protocol_ipv6" : "disabled",
    "http_put_response_hop_limit" : 2,
    "http_tokens" : "required",
    "instance_metadata_tags" : "disabled"
  }
  tags = {
    "Name" : "storagegateway-wizard 31474ebc",
    "storagegateway:wizard:date" : "2024-08-14T21:27:59.570Z",
    "storagegateway:wizard:id" : "31474ebc",
    "storagegateway:wizard:user" : "arn:${local.aws_partition}:iam::${local.aws_account_id}:root"
  }
  device_name_list = {
    "/dev/sdb" : {
      "iops" : 3000,
      "throughput" : 125,
      "size" : 150,
      "tags" : {
        "Name" : "storagegateway-wizard 31474ebc",
        "storagegateway:wizard:date" : "2024-08-14T21:27:59.570Z",
        "storagegateway:wizard:id" : "31474ebc",
        "storagegateway:wizard:user" : "arn:${local.aws_partition}:iam::${local.aws_account_id}:root"
      },
      "type" : "gp3"
    }
  }
}
