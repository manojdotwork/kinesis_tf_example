
data "template_file" "firehose_iam_policy" {
    template = "${file("${path.module}/files/firehose_role_policy.json")}"

    vars {
        s3_bucket_name          = "${var.s3_bucket_name}"
        account_number          = "${var.account_number}"
        application_name        = "${var.application_name}"
        region                  = "${var.region}"
        firehose_stream_name    = "${var.firehose_stream_name}"
        kinesis_stream_name     = "${var.kinesis_stream_name}"
    }
}

data "template_file" "firehose_role_trust" {
    template = "${file("${path.module}/files/firehose_role_trust.json")}"
}

resource "aws_iam_role" "firehose_role"
{
    name = "${var.application_name}FireHoseRole"
    assume_role_policy = "${data.template_file.firehose_role_trust.rendered}"
}

resource "aws_iam_role_policy" "firehose_role_policy" 
{
    name        = "${var.application_name}FireHosePolicy"
    role        = "${aws_iam_role.firehose_role.id}"
    policy      = "${data.template_file.firehose_iam_policy.rendered}"
}


data "template_file" "lambda_role_trust" {
    template = "${file("${path.module}/files/lambda_role_trust.json")}"
}

resource "aws_iam_role" "lambda_role"
{
    name = "${var.application_name}LambdaRole"
    assume_role_policy = "${data.template_file.lambda_role_trust.rendered}"
}
