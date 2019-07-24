resource "aws_iam_role" "lambda_exec" {
  name                    = "LambdaBasicExecRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_iam_policy" "lambda_exec" {
  name        = "lambda_exec_policy"
  path        = "/"
  description = "lambda_exec_policy"
  policy      = "${data.template_file.lambda_exec-iam.rendered}"
}

data "template_file" "lambda_exec-iam" {
  template = "${file("${path.module}/iam.tpl")}"
}

resource "aws_iam_policy_attachment" "lambda_exec_role-attach" {
  name       = "lambda_exec_attach"
  roles      = ["${aws_iam_role.lambda_exec.name}"]
  policy_arn = "${aws_iam_policy.lambda_exec.arn}"
  depends_on = ["aws_iam_policy.lambda_exec", "aws_iam_role.lambda_exec"]
}