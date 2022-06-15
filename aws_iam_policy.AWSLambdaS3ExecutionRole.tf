resource "aws_iam_policy" "AWSLambdaS3ExecutionRole" {
  name_prefix = "AWSLambdaS3ExecutionRole"
  path        = "/service-role/"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject"
        ],
        "Resource" : "arn:aws:s3:::*"
      }
    ]
  })
  lifecycle {
    create_before_destroy = true
  }
}
