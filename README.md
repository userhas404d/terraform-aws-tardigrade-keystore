# terraform-aws-tardigrade-keystore

Terraform module to create a keystore within S3/SSM


<!-- BEGIN TFDOCS -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| bucket\_name | Name of the keystore S3 bucket, must already exist. For SSM Parameter, bucket name will be used as prefix for the parameter names | `string` | n/a | yes |
| backend | Specify which backend to store the keys and values: s3 or ssm | `string` | `"s3"` | no |
| create\_keystore | Controls whether to create the keystore | `bool` | `true` | no |
| key\_value\_map | Map of keys and values | `map(string)` | `{}` | no |
| kms\_key\_id | Specify the KMS key id or arn for encrypting SecureString. Only applicable for "ssm" backend | `string` | `""` | no |
| tags | A map of tags to add to the keystore objects | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_objects | List of buckey objects created by the keystore module |
| ssm\_parameters | List of ssm parameter objects created by the keystore module |

<!-- END TFDOCS -->
