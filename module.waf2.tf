module "waf2" {
  source      = "git::https://github.com/JamesWoolfenden/terraform-aws-waf2.git?ref=718f0aa1a0657a021ea96d224f938995fe85be02"
  kms_key_arn = aws_kms_key.waf2.arn
}
