resource "aws_iam_role" "updatepolicy" {
  name = var.name
  path = "/service-role/"
  managed_policy_arns = [
    aws_iam_policy.AWSLambdaBasicExecutionRole.arn,
    aws_iam_policy.AWSLambdaS3ExecutionRole.arn,
    aws_iam_policy.AWSLambdaVPCAccessExecutionRole.arn,
  ]
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "lambda.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
}

