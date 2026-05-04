resource "aws_security_group" "lb_sg" {
  # checkov:skip=CKV_AWS_382: Unrestricted outbound access required for resource functionality
  description = "Load balancer SG"
  vpc_id      = var.vpc_id
  tags        = var.tags
}
