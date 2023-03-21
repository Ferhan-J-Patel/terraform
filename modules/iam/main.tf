provider "aws" {
    region = "ap-south-1"
}

resource "aws_iam_user" "newuser" {
    name = "Cloud-lab-user"
}

resource "aws_iam_user_login_profile" "administrator" {
  user                    = aws_iam_user.newuser.name
  password_reset_required = false
}

resource "aws_iam_access_key" "example" {
  user = aws_iam_user.newuser.name
}



