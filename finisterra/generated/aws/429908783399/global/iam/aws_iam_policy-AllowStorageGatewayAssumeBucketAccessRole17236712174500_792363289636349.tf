locals {
  policy_name_215915fac0 = "AllowStorageGatewayAssumeBucketAccessRole17236712174500.792363289636349"
}

module "aws_iam_policy-AllowStorageGatewayAssumeBucketAccessRole17236712174500_792363289636349" {
  source           = "github.com/finisterra-io/terraform-aws-iam//modules/iam_policy?ref=298005618b90b7e0c6afc7b8f9ffac99c14401df"
  policy_documents = <<EOF
{
  "Statement": [
    {
      "Action": [
        "s3:GetAccelerateConfiguration",
        "s3:GetBucketLocation",
        "s3:GetBucketVersioning",
        "s3:ListBucket",
        "s3:ListBucketVersions",
        "s3:ListBucketMultipartUploads"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::sgw-2024-08-14-vcpmu"
    },
    {
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:DeleteObject",
        "s3:DeleteObjectVersion",
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:GetObjectVersion",
        "s3:ListMultipartUploadParts",
        "s3:PutObject",
        "s3:PutObjectAcl"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::sgw-2024-08-14-vcpmu/*"
    }
  ],
  "Version": "2012-10-17"
}
EOF

  policy_name        = local.policy_name_215915fac0
  policy_description = "Allow Storage Gateway to access: sgw-2024-08-14-vcpmu"
  path               = "/service-role/"
}
