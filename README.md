# terraform-aws-alb

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-alb/workflows/Verify/badge.svg?branch=main)](https://github.com/JamesWoolfenden/terraform-aws-alb)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-alb.svg)](https://github.com/JamesWoolfenden/terraform-aws-alb/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-alb.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-alb/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-alb/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-alb&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-alb/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-alb&benchmark=INFRASTRUCTURE+SECURITY)

Terraform module -

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

This is just a very basic example.

```cli
$ checkov -d . --external-checks-dir checkov
...
```

Include **module.alb.tf** this repository as a module in your existing terraform code:

```terraform
module "alb" {
  source        = "JamesWoolfenden/alb/aws"
  version       = "0.0.1"
  subnet_ids    = ["subnet-03fdfb13a135366a7","subnet-08d97e381dbc80d40","subnet-05a6a6de2f4989d22"]
  lb_name       = "exmpl"
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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_waf2"></a> [waf2](#module\_waf2) | git::https://github.com/JamesWoolfenden/terraform-aws-waf2.git | 718f0aa1a0657a021ea96d224f938995fe85be02 |

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.waf2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_lb.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_s3_bucket.lb_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.lb_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_policy.examplea](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.pike](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_security_group.lb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_wafv2_web_acl_association.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_association) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ELB_RegionalAccount"></a> [ELB\_RegionalAccount](#input\_ELB\_RegionalAccount) | Default account ID for ELB -default is eu-west-2 | `string` | `"652711504416"` | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | n/a | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `list(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map for tags | `map(any)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | n/a |
| <a name="output_kms"></a> [kms](#output\_kms) | n/a |
| <a name="output_lb"></a> [lb](#output\_lb) | n/a |
| <a name="output_sg"></a> [sg](#output\_sg) | n/a |
| <a name="output_waf"></a> [waf](#output\_waf) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
resource "aws_iam_policy" "terraform_pike" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "apigateway:SetWebACL"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "apprunner:AssociateWebAcl",
                "apprunner:DescribeWebAclForService",
                "apprunner:DisassociateWebAcl",
                "apprunner:ListAssociatedServicesForWebAcl"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "appsync:SetWebACL"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": [
                "cognito-idp:AssociateWebACL",
                "cognito-idp:DisassociateWebACL",
                "cognito-idp:GetWebACLForResource",
                "cognito-idp:ListResourcesForWebACL"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor4",
            "Effect": "Allow",
            "Action": [
                "ec2:CreateSecurityGroup",
                "ec2:CreateTags",
                "ec2:DeleteSecurityGroup",
                "ec2:DeleteTags",
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeSecurityGroups",
                "ec2:RevokeSecurityGroupEgress"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor5",
            "Effect": "Allow",
            "Action": [
                "elasticloadbalancing:AddTags",
                "elasticloadbalancing:CreateLoadBalancer",
                "elasticloadbalancing:DeleteLoadBalancer",
                "elasticloadbalancing:DescribeLoadBalancerAttributes",
                "elasticloadbalancing:DescribeLoadBalancers",
                "elasticloadbalancing:DescribeTags",
                "elasticloadbalancing:ModifyLoadBalancerAttributes",
                "elasticloadbalancing:RemoveTags",
                "elasticloadbalancing:SetSecurityGroups",
                "elasticloadbalancing:SetWebAcl"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor6",
            "Effect": "Allow",
            "Action": [
                "firehose:CreateDeliveryStream",
                "firehose:DeleteDeliveryStream",
                "firehose:DescribeDeliveryStream",
                "firehose:ListTagsForDeliveryStream"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor7",
            "Effect": "Allow",
            "Action": [
                "iam:CreateRole",
                "iam:DeleteRole",
                "iam:GetRole",
                "iam:ListAttachedRolePolicies",
                "iam:ListInstanceProfilesForRole",
                "iam:ListRolePolicies",
                "iam:PassRole"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor8",
            "Effect": "Allow",
            "Action": [
                "kms:CreateKey",
                "kms:DescribeKey",
                "kms:EnableKeyRotation",
                "kms:GetKeyPolicy",
                "kms:GetKeyRotationStatus",
                "kms:ListResourceTags",
                "kms:PutKeyPolicy",
                "kms:ScheduleKeyDeletion",
                "kms:TagResource",
                "kms:UntagResource"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor9",
            "Effect": "Allow",
            "Action": [
                "s3:CreateBucket",
                "s3:DeleteBucket",
                "s3:GetAccelerateConfiguration",
                "s3:GetBucketAcl",
                "s3:GetBucketCORS",
                "s3:GetBucketLogging",
                "s3:GetBucketObjectLockConfiguration",
                "s3:GetBucketPolicy",
                "s3:GetBucketPublicAccessBlock",
                "s3:GetBucketRequestPayment",
                "s3:GetBucketTagging",
                "s3:GetBucketVersioning",
                "s3:GetBucketWebsite",
                "s3:GetEncryptionConfiguration",
                "s3:GetLifecycleConfiguration",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:GetReplicationConfiguration",
                "s3:ListAllMyBuckets",
                "s3:ListBucket",
                "s3:PutBucketAcl",
                "s3:PutBucketLogging",
                "s3:PutBucketPolicy",
                "s3:PutBucketPublicAccessBlock",
                "s3:PutEncryptionConfiguration",
                "s3:PutLifecycleConfiguration"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor10",
            "Effect": "Allow",
            "Action": [
                "wafv2:AssociateWebACL",
                "wafv2:CreateRuleGroup",
                "wafv2:CreateWebACL",
                "wafv2:DeleteRuleGroup",
                "wafv2:DeleteWebACL",
                "wafv2:DisassociateWebACL",
                "wafv2:GetLoggingConfiguration",
                "wafv2:GetRuleGroup",
                "wafv2:GetWebACL",
                "wafv2:GetWebACLForResource",
                "wafv2:ListTagsForResource",
                "wafv2:PutLoggingConfiguration",
                "wafv2:UpdateRuleGroup"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
})
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-alb/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-alb/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2022-2023 James Woolfenden

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
