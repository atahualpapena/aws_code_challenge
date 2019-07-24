resource "aws_api_gateway_rest_api" "users" {
    name = "users"
    description = "API Gateway to manage user registration and login"
    body = "${file("${path.module}/users-api.json")}"

    endpoint_configuration {
        types = ["REGIONAL"]
    }
}