provider "aws" {
  profile = var.profile
  region = var.region

  assume_role {
    role_arn = var.assumeRole ? "arn:aws:iam::${var.accountID}:role/${var.assumableRole}" : null
  }
}

resource "aws_kms_key" "vss" {
  tags                    = { name = var.name }
  description             = var.description

  deletion_window_in_days = var.days_before_delete
  enable_key_rotation     = var.enable_key_rotation

  multi_region            = var.multi_region

  policy                  = file("${var.json_path}/${var.name}.json")
}