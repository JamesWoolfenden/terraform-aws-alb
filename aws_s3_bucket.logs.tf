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
