module "create" {
   source               = "./tf_lambda"
   customer_name        = "ownzones"
   lambda_name          = "create"
   lambda_handler       = "lambda_function.lambda_handler"
   lambda_runtime       = "python3.6"
   lambda_alias         = "Production"
   karma_basic_exec     = "${module.iam.lambda_exec}"
}