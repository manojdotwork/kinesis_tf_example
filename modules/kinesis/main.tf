resource "aws_kinesis_stream" "test_stream" {
    name             = "${var.kinesis_stream_name}"
    shard_count      = "${var.shard_count}"
    retention_period = "${var.retention_period}"

    shard_level_metrics = [
        "IncomingBytes",
        "OutgoingBytes"
    ]
    tags = {
        Environment = "${var.environment}"
    }
}
resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream"
{
    name        = "${var.firehose_stream_name}"
    destination = "extended_s3"
    kinesis_source_configuration
    {
        kinesis_stream_arn = "${aws_kinesis_stream.test_stream.arn}"
        role_arn           = "${var.firehose_role_arn}"
    }

    
    extended_s3_configuration
    {
        role_arn   = "${var.firehose_role_arn}"
        bucket_arn = "${var.s3_bucket_arn}"

        processing_configuration
        {
            enabled = "true"

            processors
            {
                type = "Lambda"

                parameters
                {
                    parameter_name  = "LambdaArn"
                    parameter_value = "${var.lambda_function_arn}:$LATEST"
                }
            }
        }
    }
}
