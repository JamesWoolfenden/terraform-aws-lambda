resource "aws_iam_policy" "vpc" {
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
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
