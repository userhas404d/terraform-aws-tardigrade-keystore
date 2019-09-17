output "bucket_objects" {
  description = "List of buckey objects created by the keystore module"
  value       = var.backend == "s3" ? aws_s3_bucket_object.this[*] : []
}

output "ssm_parameters" {
  description = "List of ssm parameter objects created by the keystore module"
  value       = var.backend == "ssm" ? aws_ssm_parameter.this[*] : []
}
