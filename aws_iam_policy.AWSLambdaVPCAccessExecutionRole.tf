resource "aws_iam_policy" "vpc" {
  name_prefix = "LambdaVPC"
  path        = "/service-role/"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:CreateNetworkInterface",
          "ec2:DeleteNetworkInterface",
          "ec2:DescribeNetworkInterfaces"
        ],
        "Resource" : "*"
      }
    ]
  })
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "vpc-attach" {
  role       = aws_iam_role.updatepolicy.name
  policy_arn = aws_iam_policy.vpc.arn
}
