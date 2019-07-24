resource "aws_lambda_function" "lambda" {
  function_name           = "${var.lambda_name}"
  s3_bucket               = "${var.bucket_name}"
  s3_key                  = "${var.lambda_name}/${var.lambda_name}.zip"
  handler                 = "${var.lambda_handler}"
  runtime                 = "${var.lambda_runtime}"
  role                    = "${var.lambda_exec}"
}