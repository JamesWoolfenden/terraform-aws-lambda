[![Slalom][logo]](https://slalom.com)

# terraform-aws-lambda

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-lambda/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-lambda)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-lambda.svg)](https://github.com/JamesWoolfenden/terraform-aws-lambda/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

Test project for

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

This is a minimal example **examplea**, but with Cloudwatch alarms enabled.

```hcl
module "lambda" {
  source = "github.com/jameswoolfenden/terraform-aws-lambda"
  version= "0.3.40"
  account_id     = data.aws_caller_identity.current.account_id
  alarms_enabled = true
  common_tags    = var.common_tags
  description    = "Best Pizza!!"
  filename       = "${path.module}/lambda.zip"
  name           = var.name
  region_name    = data.aws_region.current.name
  role_arn       = data.aws_iam_role.lambda.arn
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Error: no lines in file
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Further work

Connection to cloudwatch metric and attach subscription to Slack.

Determine when ConcurrentExecutions or Invocations exceeds your threshold

- <https://docs.aws.amazon.com/lambda/latest/dg/monitoring-functions-metrics.html>
and
- <https://aws.amazon.com/blogs/architecture/best-practices-for-developing-on-aws-lambda/?sc_channel=sm&sc_campaign=AWS_Blog&sc_publisher=LINKEDIN&sc_country=Global&sc_geo=GLOBAL&sc_outcome=awareness&trk=AWS_Blog_LINKEDIN&sc_category=AWS_Lambda,AWS+Lambda&linkId=70615743>

and connect up the aws chatbot to slack/bot

- <https://us-east-2.console.aws.amazon.com/chatbot/home#/>
- <https://docs.aws.amazon.com/chatbot/latest/adminguide/setting-up.html>

General:

- <https://www.concurrencylabs.com/blog/how-to-operate-aws-lambda/>
- Add support for sns subscriptions.
- Add in support for keeping lambda warm.

What alarms are important:

- <https://www.concurrencylabs.com/blog/how-to-operate-aws-lambda/>
- <https://dev.to/frosnerd/monitoring-aws-lambda-functions-with-cloudwatch-1nap>
- <https://aws.amazon.com/blogs/compute/investigating-spikes-in-aws-lambda-function-concurrency/>

Right sizing Lambdas:

- timeouts to close to invocation length
- no of failed or throttled
- memory usage - am i over provisioned?
- memory usage - more tin required?
- size of payload is related to the start time

## Related Projects

Check out these related projects.

- [terraform-aws-codecommit](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Storing ones code

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-lambda/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-lambda/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2020 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-lambda&url=https://github.com/JamesWoolfenden/terraform-aws-lambda
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-lambda&url=https://github.com/JamesWoolfenden/terraform-aws-lambda
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-lambda
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-lambda
[share_email]: mailto:?subject=terraform-aws-lambda&body=https://github.com/JamesWoolfenden/terraform-aws-lambda
