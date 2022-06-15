module "lambda" {
  source         = "../../"
  alarms_enabled = true
  description    = "Best Pizza!!"
  filename       = "${path.module}/lambda.zip"
  name           = var.name
  region    = data.aws_region.current.name
  kms_key_id     = aws_kms_key.example.arn
}
