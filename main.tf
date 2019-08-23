provider "aws" {}

locals {
  keys = "${keys(var.key_value_map)}"

  #list of possible backend types support by the keystore module
  backends = [
    "s3",
    "ssm",
  ]

  #test input backend provide by the users
  is_backend_valid = "${contains(local.backends, var.backend)}"
}

resource "null_resource" "is_backend_valid" {
  # forces/outputs an error when var.backend is invalid
  count = "${!local.is_backend_valid ? 1 : 0}"

  "ERROR: var.backend (${var.backend}) is invalid. Must be one of: ${join(", ", local.backends)}" = true
}

resource "aws_s3_bucket_object" "this" {
  count = "${var.create_keystore && var.backend == "s3" ? length(local.keys) : 0}"

  bucket       = "${var.bucket_name}"
  key          = "${local.keys[count.index]}"
  content      = "${var.key_value_map[local.keys[count.index]]}"
  content_type = "application/json"
  etag         = "${md5(var.key_value_map[local.keys[count.index]])}"
  tags         = "${var.tags}"
}

resource "aws_ssm_parameter" "this" {
  count = "${var.create_keystore && var.backend == "ssm" ? length(local.keys) : 0}"

  type   = "SecureString"
  name   = "${replace("/${var.bucket_name}/${local.keys[count.index]}","////", "/")}"
  value  = "${var.key_value_map[local.keys[count.index]]}"
  key_id = "${var.kms_key_id}"
  tags   = "${var.tags}"
}
