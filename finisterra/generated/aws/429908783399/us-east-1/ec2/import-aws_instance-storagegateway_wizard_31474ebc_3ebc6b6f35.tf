import {
  id = "i-013a8d491d1f444eb"
  to = module.aws_instance-storagegateway_wizard_31474ebc_3ebc6b6f35.aws_instance.default[0]
}

import {
  id = "/dev/sdb:vol-0c0096551a3d32742:i-013a8d491d1f444eb"
  to = module.aws_instance-storagegateway_wizard_31474ebc_3ebc6b6f35.aws_volume_attachment.default["/dev/sdb"]
}

import {
  id = "vol-0c0096551a3d32742"
  to = module.aws_instance-storagegateway_wizard_31474ebc_3ebc6b6f35.aws_ebs_volume.default["/dev/sdb"]
}

