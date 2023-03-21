variable "policy_arns" {
    type = list(string)
    default = ["arn:aws:iam::aws:policy/AmazonEC2FullAccess",
                "${aws_iam_policy.custom_policy.0.arn}"
                ]
}

resource "aws_iam_policy" "custom_policy" {
  name        = "AmazonEC2FullAccess"
  description = "A ec2 policy"
  policy      = "${file("region_restrict.json")}"
}

resource "aws_iam_user_policy_attachment" "demo-attach"{
    count = length(var.policy_arns)
    user = var.iam_user
    policy_arn = var.policy_arns[count.index]
}
