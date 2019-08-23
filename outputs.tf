output "keys" {
  description = "List of keys created by the keystore module"
  value       = ["${split(",",coalesce(join(",",aws_s3_bucket_object.this.*.id), join(",",aws_ssm_parameter.this.*.name)))}"]
}

output "etags" {
  description = "List of ETags generated for each object in the keystore"
  value       = ["${aws_s3_bucket_object.this.*.etag}"]
}
