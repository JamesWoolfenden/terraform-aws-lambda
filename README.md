# terraform-aws-lambda

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-lambda/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-lambda)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-lambda.svg)](https://github.com/JamesWoolfenden/terraform-aws-lambda/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-lambda.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-lambda/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-lambda/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-lambda&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-lambda/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-lambda&benchmark=INFRASTRUCTURE+SECURITY)

---

Minimal Terraform module.

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
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.basic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.updatepolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.basic-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.kms-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.s3-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.vpc-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.withintent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action"></a> [action](#input\_action) | Action for the Lambda permission | `string` | `"lambda:InvokeFunction"` | no |
| <a name="input_alarms_enabled"></a> [alarms\_enabled](#input\_alarms\_enabled) | Cloudwatch alarms enabled | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Of the the Lambda | `string` | n/a | yes |
| <a name="input_envvar"></a> [envvar](#input\_envvar) | Optional set of environmental variables for the lambda | `map(any)` | `{}` | no |
| <a name="input_ephemeral_storage"></a> [ephemeral\_storage](#input\_ephemeral\_storage) | Storage for lambda Min 512 MB and the Max 10240 MB | `number` | `512` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | name of zip file if any | `string` | `null` | no |
| <a name="input_handler"></a> [handler](#input\_handler) | The file the lambda should import | `string` | `"index.handler"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | Your KMS Key ARN | `string` | n/a | yes |
| <a name="input_layers"></a> [layers](#input\_layers) | Optionally, add in up 5 lambda layers | `list(any)` | `[]` | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | Of the the lambda | `string` | `"128"` | no |
| <a name="input_metric_comparison_operator"></a> [metric\_comparison\_operator](#input\_metric\_comparison\_operator) | For Cloudwatch Alarms | `string` | `"GreaterThanThreshold"` | no |
| <a name="input_metric_datapoints_to_alarm"></a> [metric\_datapoints\_to\_alarm](#input\_metric\_datapoints\_to\_alarm) | For Cloudwatch Alarms | `number` | `1` | no |
| <a name="input_metric_evaluation_periods"></a> [metric\_evaluation\_periods](#input\_metric\_evaluation\_periods) | For Cloudwatch Alarms | `number` | `1` | no |
| <a name="input_metric_metric_name"></a> [metric\_metric\_name](#input\_metric\_metric\_name) | n/a | `string` | `"Invocations"` | no |
| <a name="input_metric_period"></a> [metric\_period](#input\_metric\_period) | n/a | `number` | `300` | no |
| <a name="input_metric_statistic"></a> [metric\_statistic](#input\_metric\_statistic) | n/a | `string` | `"Average"` | no |
| <a name="input_metric_threshold"></a> [metric\_threshold](#input\_metric\_threshold) | n/a | `number` | `100` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of Lambda object | `string` | n/a | yes |
| <a name="input_prefixdash"></a> [prefixdash](#input\_prefixdash) | Support for renaming on multi-environments | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | Aws region name, eu-west-1... | `string` | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Language the code runs in | `string` | `"python3.8"` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | path to the lambda bucket | `string` | `null` | no |
| <a name="input_s3_key"></a> [s3\_key](#input\_s3\_key) | path to the lambda zip | `string` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | The IDs of some security groups | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet IDs... | `list(string)` | `[]` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Of the the lambda | `string` | `"100"` | no |
| <a name="input_tracing_mode"></a> [tracing\_mode](#input\_tracing\_mode) | Enable X-ray and in what mode Active or PassThrough | `string` | `"Active"` | no |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | Optional Vpc attachment config | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda"></a> [lambda](#output\_lambda) | n/a |
| <a name="output_role"></a> [role](#output\_role) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Further work

If you provision this lambda inside a VPC and want to call aws services from with it, youmay need to deploy a Private endpoint to support that.

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

Copyright 2019-2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-lambda&url=https://github.com/JamesWoolfenden/terraform-aws-lambda
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-lambda&url=https://github.com/JamesWoolfenden/terraform-aws-lambda
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-lambda
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-lambda
[share_email]: mailto:?subject=terraform-aws-lambda&body=https://github.com/JamesWoolfenden/terraform-aws-lambda
