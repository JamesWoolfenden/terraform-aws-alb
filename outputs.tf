output "lb" {
  value = aws_lb.example
}

output "kms" {
  value = aws_kms_key.waf2
}

output "bucket" {
  value = aws_s3_bucket.lb_logs
}

output "sg" {
  value = aws_security_group.lb_sg
}

output "waf" {
  value = module.waf2
}
