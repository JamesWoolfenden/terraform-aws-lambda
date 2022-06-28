resource "aws_iam_role" "updatepolicy" {
  name = var.name
  path = "/service-role/"

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
  lifecycle {
    create_before_destroy = true
  }
}
