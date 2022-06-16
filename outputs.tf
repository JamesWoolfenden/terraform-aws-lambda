
output "lambda" {
  value = aws_lambda_function.withintent
}

output "role" {
  value = aws_iam_role.updatepolicy
}
