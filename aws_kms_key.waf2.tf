resource "aws_kms_key" "waf2" {
  enable_key_rotation = true
  policy              = <<POLICY
{
  "Sid": "Enable IAM User Permissions",
  "Effect": "Allow",
  "Principal": {
    "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
   },
  "Action": "kms:*",
  "Resource": "*"
}
POLICY
  tags                = var.tags
}

data "aws_caller_identity" "current" {}
