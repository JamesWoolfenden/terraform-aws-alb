module "waf2" {
  source  = "JamesWoolfenden/waf2/aws"
  version = "0.0.5"
  kms_key_arn=aws_kms_key.waf2.arn
}