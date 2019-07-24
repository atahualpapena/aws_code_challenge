resource "aws_cognito_user_pool" "App-Users" {
  name                          = "App Users"
  password_policy {
    minimum_length              = 8
    require_numbers             = true
    require_symbols             = true
    require_uppercase           = true
    require_lowercase           = true
  }
}

resource "aws_cognito_user_pool_client" "App-Client" {
  name                          = "App Client"
  user_pool_id                  = "us-west-2_A4hptIkbF"
  generate_secret               = true
  explicit_auth_flows           = ["USER_PASSWORD_AUTH"]
  refresh_token_validity        = 30
}

resource "aws_cognito_identity_pool" "UsersIdentityPool" {
  identity_pool_name               = "UsersIdentityPool"
  allow_unauthenticated_identities = true

  cognito_identity_providers {
    client_id               = "203c8v9lfta88mj3mon78h3eaf"
    server_side_token_check = false
  }
}

resource "aws_iam_role" "group_role" {
  name = "user-group-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
