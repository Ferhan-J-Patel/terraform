resource "aws_iam_policy" "policy" {
  name        = "AmazonEC2FullAccess"
  description = "A ec2 policy"
  policy      = "${file("region_restrict.json")}"
}

resource "aws_iam_user_policy_attachment" "demo-attach"{
    user = var.iam_user
    policy_arn = ["arn:aws:iam::aws:policy/AmazonEC2FullAccess","aws_iam_policy.policy.0.arn"]
}
