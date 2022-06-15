resource "aws_lambda_function" "withintent" {
  #checkov:skip=CKV_AWS_115:Not relevant
  #checkov:skip=CKV_AWS_116:Not relevant
  description   = var.description
  function_name = var.name
  filename      = var.filename
  source_code_hash = filebase64sha256(var.filename)
  handler       = var.handler
  layers        = var.layers
  memory_size   = var.memory_size
  role          = aws_iam_role.updatepolicy.arn
  runtime       = var.runtime
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key
  timeout       = var.timeout
  kms_key_arn = var.kms_key_id

  environment {
    variables = var.envvar
  }

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  tracing_config {
    mode = "PassThrough"
  }

  ephemeral_storage {
    size = var.ephemeral_storage
  }
}
