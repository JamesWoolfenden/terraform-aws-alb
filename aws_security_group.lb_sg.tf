resource "aws_security_group" "lb_sg" {
  description = "Load balancer SG"
  vpc_id      = var.vpc_id
  tags        = var.tags
}
