resource "aws_security_group" "datacenter_sg_resource" {
  name        = var.KKE_sg
  description = "Security group for the datacenter"
}