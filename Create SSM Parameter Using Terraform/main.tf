resource "aws_ssm_parameter" "devops-ssm-parameter" {
  name  = "devops-ssm-parameter"
  type  = "String"
  value = "devops-value"
}