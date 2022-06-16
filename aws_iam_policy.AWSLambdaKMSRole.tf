resource "aws_iam_policy" "AWSLambdaKMSRole" {
  name_prefix = "AWSLambdaKMSRole"
  path        = "/service-role/"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "kms:GetParametersForImport",
          "kms:GetPublicKey",
          "kms:ListKeyPolicies",
          "kms:ListRetirableGrants",
          "kms:GetKeyRotationStatus",
          "kms:GetKeyPolicy",
          "kms:DescribeKey",
          "kms:ListResourceTags",
          "kms:ListGrants"
        ],
        "Resource" : "arn:aws:kms:*:${data.aws_caller_identity.current.account_id}:key/*"
      },
      {
        "Sid" : "VisualEditor1",
        "Effect" : "Allow",
        "Action" : [
          "kms:DescribeCustomKeyStores",
          "kms:ListKeys",
          "kms:ListAliases"
        ],
        "Resource" : "*"
      }
    ]
  })

  lifecycle {
    create_before_destroy = true
  }
}
