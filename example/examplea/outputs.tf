output "memory_size" {
  value = module.lambda.memory_size
}

output "timeout" {
  value = module.lambda.timeout
}

output "source_code_size" {
  value = module.lambda.source_code_size
}

output "lambda_arn" {
  value = module.lambda.lambda_arn
}
