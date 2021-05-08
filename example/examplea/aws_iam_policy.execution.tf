resource "aws_iam_policy" "execution" {
  policy = data.aws_iam_policy_document.lambda.json
}
