resource "aws_s3_bucket_server_side_encryption_configuration" "pike" {
  bucket = aws_s3_bucket.lb_logs.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.waf2.arn
      sse_algorithm     = "aws:kms"
    }
  }
}