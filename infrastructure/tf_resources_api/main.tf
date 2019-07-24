resource "aws_api_gateway_rest_api" "resources" {
    name = "resources"
    description = "API Gateway to manage resource creation and deletion"
    body = "${file("${path.module}/resources-api.json")}"

    endpoint_configuration {
        types = ["REGIONAL"]
    }
}