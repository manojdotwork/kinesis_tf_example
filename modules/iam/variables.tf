variable "application_name" {
  description = "Application name"
}

variable "s3_bucket_name" {
  description = "S3 Bucket name"
}

variable "account_number" {
  description = "AWS Account number"
}
variable "region"
{
	description="AWS Region"
}
variable "kinesis_stream_name"
{
	description="Kinesis stream name"
}
variable "firehose_stream_name"
{
	description="Firehose stream name"
}