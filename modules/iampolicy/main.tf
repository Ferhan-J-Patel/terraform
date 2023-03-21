resource "aws_iam_policy" "policy" {
  name        = "AmazonEC2FullAccess"
  description = "A ec2 policy"
  policy      = "${file("region_restrict.json")}"
}

variable "policy_arns" {
    type = list(string)
    value = ["arn:aws:iam::aws:policy/AmazonEC2FullAccess","aws_iam_policy.policy.arn"]
}

resource "aws_iam_user_policy_attachment" "demo-attach"{
    count = length(var.policy_arns)
    user = var.iam_user
    policy_arn = var.policy_arns[count.index].value
}
