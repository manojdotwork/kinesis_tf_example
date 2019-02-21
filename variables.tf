
variable "account_number"
{
	description="AWS Account number, will be used in ARN for IAM policies"
}

/* Set ENV $TF_VAR_rebion=eu-west-1 */
variable "region"
{
	description="AWS Region"
}
variable "environment"
{
	description="Application environment"
}

variable "application_name" {
  description = "Application name"
}

variable "shard_count"
{
	description="Kinesis stream shard count"
}
variable "retention_period"
{
	description="Kinesis data retention period"
}