resource "aws_iam_policy" "s3" {
  name_prefix = "LambdaS3"
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

resource "aws_iam_role_policy_attachment" "s3-attach" {
  role       = aws_iam_role.updatepolicy.name
  policy_arn = aws_iam_policy.s3.arn
}
