# kinesis_tf_example
Terraform deployment for basic Kinesis data ingestion, data transformation using Lambda and data destination to S3

Give values for variables in terraform.tfvars

In Lambda function, only suffixing the string to demonstrate that data stored in S3 is transformed/pre-processed.


/** Data ingestion **/

aws kinesis put-record --stream-name <kinesis-stream-name> --partition-key <partition-key-value> --data <actual-data>
