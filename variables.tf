variable "create_keystore" {
  description = "Controls whether to create the keystore"
  default     = true
}

variable "bucket_name" {
  description = "Name of the keystore S3 bucket, must already exist. For SSM Parameter, bucket name will be used as prefix for the parameter names"
  type        = "string"
  default     = ""
}

variable "key_value_map" {
  description = "Map of keys and values"
  type        = "map"
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to the keystore objects"
  type        = "map"
  default     = {}
}

variable "backend" {
  description = "Specify which backend to store the keys and values: s3 or ssm"
  default     = "s3"
}

variable "kms_key_id" {
  default     = ""
  description = "Specify the KMS key id or arn for encrypting SecureString. Only applicable for \"ssm\" backend"
}
