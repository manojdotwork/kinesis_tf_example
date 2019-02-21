variable "application_name" {
  description = "Application name"
}
variable "kinesis_stream_name"
{
	description="Kinesis stream name"
}
variable "firehose_stream_name"
{
	description="Firehose stream name"
}
variable "firehose_role_arn"
{
	description="Firehose role ARN"
}
variable "lambda_role_arn"
{
	description="Lambda role ARN"
}
variable "lambda_function_arn"
{
	description="Lambda function ARN"
}

variable "s3_bucket_arn" {
  description = "S3 bucket ARN"
}
variable "environment"
{
	description="Application environment"
}
variable "shard_count"
{
	description="Kinesis stream shard count"
}
variable "retention_period"
{
	description="Kinesis data retention period"
}