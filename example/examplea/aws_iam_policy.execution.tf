resource "aws_iam_policy" "execution" {
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
  policy = data.aws_iam_policy_document.lambda.json
}
