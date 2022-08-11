resource "aws_s3_bucket" "lb_logs" {
  # checkov:skip=CKV_AWS_144: v4 Legacy
  # checkov:skip=CKV_AWS_18: v4 Legacy
  # checkov:skip=CKV_AWS_145: v4 Legacy
  # checkov:skip=CKV_AWS_19: v4 Legacy
  # checkov:skip=CKV_AWS_21: v4 Legacy
}

resource "aws_s3_bucket_public_access_block" "logs" {
  bucket                  = aws_s3_bucket.lb_logs.id
  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
}

resource "aws_s3_bucket_policy" "examplea" {
  bucket = aws_s3_bucket.lb_logs.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "AWSConsole-AccessLogs-Policy-1611836550779",
    "Statement": [
        {
            "Sid": "AWSConsoleStmt-1611836550781",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.ELB_RegionalAccount}:root"
            },
            "Action": "s3:PutObject",
            "Resource": "${aws_s3_bucket.lb_logs.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
        },
        {
            "Sid": "AWSLogDeliveryWrite",
            "Effect": "Allow",
            "Principal": {
                "Service": "delivery.logs.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "${aws_s3_bucket.lb_logs.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        },
        {
            "Sid": "AWSLogDeliveryAclCheck",
            "Effect": "Allow",
            "Principal": {
                "Service": "delivery.logs.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "${aws_s3_bucket.lb_logs.arn}"
        }
    ]
}
POLICY
}

variable "ELB_RegionalAccount" {
  type=string
  description = "Default account ID for ELB -default is eu-west-2"
  default = "652711504416"
}

data "aws_caller_identity" "current" {}