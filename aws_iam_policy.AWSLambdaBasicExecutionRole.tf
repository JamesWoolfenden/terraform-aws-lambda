resource "aws_iam_policy" "AWSLambdaBasicExecutionRole" {
  name_prefix = "AWSLambdaBasicExecutionRole"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:eu-west-2:680235478471:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:eu-west-2:680235478471:log-group:/aws/lambda/updatepolicy:*"
            ]
        }
    ]
})
}