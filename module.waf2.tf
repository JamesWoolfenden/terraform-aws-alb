module "waf2" {
  source      = "JamesWoolfenden/waf2/aws"
  version     = "0.1.3"
  kms_key_arn = aws_kms_key.waf2.arn
}
