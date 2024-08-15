module "aws_instance-cliente_linux_nfs_bc7de1e676" {
  source                               = "github.com/finisterra-io/terraform-aws-ec2?ref=bc5bcc8defbe1a140ef083071b2d72d78d4ae79d"
  ami                                  = "ami-0ae8f15ae66fe8cda"
  availability_zone                    = "${local.aws_region}d"
  instance_type                        = "t2.micro"
  ebs_optimized                        = false
  disable_api_termination              = false
  instance_profile                     = module.aws_iam_role-ecsInstanceRole.profiles["ecsInstanceRole"].id
  instance_initiated_shutdown_behavior = "stop"
  associate_public_ip_address          = true
  ssh_key_pair                         = module.aws_key_pair-LinuxerosCO_01_776977b626.id
  subnet_id                            = "subnet-022ec44e2586f2331"
  monitoring                           = false
  source_dest_check                    = true
  ipv6_address_count                   = 0
  tenancy                              = "default"
  security_groups = [
    module.aws_security_group-launch-wizard-1_2e44439df2.id
  ]
  root_block_device = {
    "delete_on_termination" : true,
    "encrypted" : false,
    "tags" : {},
    "throughput" : 125,
    "volume_size" : 8,
    "volume_type" : "gp3"
  }
  metadata_options = {
    "http_endpoint" : "enabled",
    "http_protocol_ipv6" : "disabled",
    "http_put_response_hop_limit" : 2,
    "http_tokens" : "required",
    "instance_metadata_tags" : "disabled"
  }
  burstable_mode = "standard"
  tags = {
    "Name" : "cliente-linux-nfs"
  }
}
