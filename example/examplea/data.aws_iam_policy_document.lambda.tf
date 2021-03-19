data "aws_iam_policy_document" "lambda" {
  #checkov:skip=CKV_AWS_111:A general role
  #checkov:skip=CKV_AWS_108:A general role
  statement {
    actions = [
      "lambda:InvokeFunction"
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:*"]
  }

  statement {
    actions = [
      "ssm:getParameter",
      "ssm:getParameters"
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface"
    ]
    resources = ["*"]
  }

}
