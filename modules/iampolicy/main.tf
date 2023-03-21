resource "aws_iam_policy" "custom_policy" {
  name        = "AmazonEC2FullAccess"
  description = "A ec2 policy"
  policy      = "${file("region_restrict.json")}"
}

output "policy_code" {
    value = aws_iam_policy.custom_policy.arn
}

resource "aws_iam_user_policy_attachment" "demo-attach"{
    for_each = toset(["arn:aws:iam::aws:policy/AmazonEC2FullAccess",
                aws_iam_policy.custom_policy.arn
                ])

    user = var.iam_user
    policy_arn = each.value
}
