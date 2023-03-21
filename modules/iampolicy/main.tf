data "terraform_remote_state" "iam_user" {
  backend = "backend_type"
  config = {
    // backend configuration for the IAM user module
  }
  workspace = "iam_user_module_workspace"
  module = "../iam"
}

resource "aws_iam_policy" "policy" {
  name        = "AmazonEC2FullAccess"
  description = "A ec2 policy"
  policy      = "${file("ec2fullaccess.json")}"
}

resource "aws_iam_user_policy_attachment" "demo-attach"{
    user = data.terraform_remote_state.iam_user.outputs.iam_username
    policy_arn = "${aws_iam_policy.policy.arn}"
}
