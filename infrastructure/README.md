# karma-tf-lambda


This terraform script deploys a new lambda into the micone aws account. 

## Creating a new Lambda

1. Add a buildspec.yml file to the Lambda's git repository. [Example](https://raw.githubusercontent.com/hatech/karma-users/master/buildspec.yml?token=AKTR7ROENDDIG5DZXZA73CK5BOWSW)
2. Add a variable for the new lambda in the [manifest](https://github.com/hatech/karma-tf-manifest), like this: ``` karma-<function_name>-version=1 ``` 
3. Clone this repo with ``` git clone ```
4. ``` cd ``` into this folder.
5. Create a file called ``` tf-mc-<function_name>.tf ```, then paste the following:

```
module "<function_name>" {
   source               = "./tf-mc-lambda"
   customer_name        = "karma"
   lambda_name          = "<function_name>"
   lambda_handler       = "index.handler"
   lambda_runtime       = "nodejs8.10"
   lambda_alias         = "Production"
   lambda_version       = "${var.function_name-version}"
   karma_basic_exec     = "${module.iam.karma_basic_exec}"
}
```

6. Add a variable to the ``` variables.tf ``` like this: 

```
variable "<function_name-version>" {}
```

7. Push your changes to the repo. 
