resource "aws_iam_policy" "custom_policy" {
  name        = "AmazonEC2FullAccess"
  description = "A ec2 policy"
  policy      = "${file("region_restrict.json")}"
}

variable "policies" {
  type = map(string)
  default = {
    policy1 = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
    policy2 = "arn:aws:iam::123456789012:policy/Policy2"
  }
}

resource "aws_iam_user_policy_attachment" "demo-attach"{
    for_each = toset(["arn:aws:iam::aws:policy/AmazonEC2FullAccess",
                "${output.custom_policy_arn}"
                ])

    user = var.iam_user
    policy_arn = each.value
}
