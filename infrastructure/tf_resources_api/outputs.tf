output "api-gw" {
    value = "${aws_api_gateway_rest_api.resources.execution_arn}"
}