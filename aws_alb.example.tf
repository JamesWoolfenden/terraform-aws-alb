resource "aws_lb" "example" {

  name_prefix        = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = var.subnet_ids

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }
  drop_invalid_header_fields = true
}



resource "aws_s3_bucket" "lb_logs" {

}


resource "aws_security_group" "lb_sg" {

}

variable "subnet_ids" {
  type = list(any)
}

resource "aws_wafv2_web_acl_association" "example" {
  resource_arn = aws_lb.example.arn
  web_acl_arn  = module.waf2.aws_wafv2_web_acl.arn
}
