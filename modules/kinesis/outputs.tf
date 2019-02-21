output "kinesis_stream_name" {
  value = "${aws_kinesis_stream.test_stream.name}"
}