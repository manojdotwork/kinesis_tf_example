
# Configure the AWS Provider
provider "aws" {
    region     = "${var.region}"
}

locals {
  bucket_name = "kinesisdata-${var.application_name}-${random_id.suffix.hex}"
  kinesis_stream_name   = "kinesis-${var.application_name}"
  firehose_stream_name  = "kinesis-firehose-${var.application_name}"
}

resource "random_id" "suffix" {
    byte_length = 4
}

module "s3" {
    source               = "./modules/s3"
    bucket_name          = "${local.bucket_name}"
}

module "iam" {
    source               = "./modules/iam"
    application_name     = "${var.application_name}"
    account_number       = "${var.account_number}"
    s3_bucket_name       = "${local.bucket_name}"
    region               = "${var.region}"
    kinesis_stream_name  = "${local.kinesis_stream_name}"
    firehose_stream_name = "${local.firehose_stream_name}"
}

module "lambda" {
    source               = "./modules/lambda"
    application_name     = "${var.application_name}"
    lambda_role_arn      = "${module.iam.lambda_role_arn}"
}

module "kinesis" {
    source               = "./modules/kinesis"
    application_name     = "${var.application_name}"
    lambda_role_arn      = "${module.iam.lambda_role_arn}"
    firehose_role_arn    = "${module.iam.firehose_role_arn}"
    shard_count          = "${var.shard_count}"
    retention_period     = "${var.retention_period}"
    environment          = "${var.environment}"
    s3_bucket_arn        = "${module.s3.bucket_arn}"
    lambda_function_arn  = "${module.lambda.lambda_function_arn}"
    kinesis_stream_name  = "${local.kinesis_stream_name}"
    firehose_stream_name = "${local.firehose_stream_name}"
}




