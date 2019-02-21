
resource "aws_s3_bucket" "kinesis_bucket" {
    bucket = "${var.bucket_name}"
    acl    = "private"
}