resource "aws_lambda_function" "lambda_processor"
{
    filename      = "lambda.zip"
    function_name = "${var.application_name}DataTransformer"
    role          = "${var.lambda_role_arn}"
    handler       = "index.handler"
    runtime       = "nodejs8.10"
}