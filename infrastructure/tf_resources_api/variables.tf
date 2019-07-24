variable "customer_name" {
   default = "ownzones"
}
variable "bucket_name" {
    default = "lambda-artifacts-ownzones-code-challenge"
}
variable "lambda_name" {}
variable "lambda_s3_key" {
   default = "s3://lambda-artifacts-ownzones-code-challenge/"
}
variable "lambda_handler" {
    default = "lambda_function"
}
variable "lambda_runtime" {
    default = "python3.6"
}

variable "lambda_exec" {}

