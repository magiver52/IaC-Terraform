import {
  id = "AWSReservedSSO_ps-linuxerosco-administrator_0f653942fe532b5f"
  to = module.aws_iam_role-AWSReservedSSO_ps-linuxerosco-administrator_0f653942fe532b5f.aws_iam_role.default[0]
}

import {
  id = "AWSReservedSSO_ps-linuxerosco-administrator_0f653942fe532b5f/arn:aws:iam::aws:policy/AdministratorAccess"
  to = module.aws_iam_role-AWSReservedSSO_ps-linuxerosco-administrator_0f653942fe532b5f.aws_iam_role_policy_attachment.managed["AWSReservedSSO_ps-linuxerosco-administrator_0f653942fe532b5f_AdministratorAccess"]
}

