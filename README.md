# terraform-aws-tardigrade-keystore

Terraform module to create a keystore within S3/SSM

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| backend | Specify which backend to store the keys and values: s3 or ssm | string | `"s3"` | no |
| bucket\_name | Name of the keystore S3 bucket, must already exist. For SSM Parameter, bucket name will be used as prefix for the parameter names | string | `""` | no |
| create\_keystore | Controls whether to create the keystore | string | `"true"` | no |
| key\_value\_map | Map of keys and values | map | `<map>` | no |
| kms\_key\_id | Specify the KMS key id or arn for encrypting SecureString. Only applicable for "ssm" backend | string | `""` | no |
| tags | A map of tags to add to the keystore objects | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| etags | List of ETags generated for each object in the keystore |
| keys | List of keys created by the keystore module |

