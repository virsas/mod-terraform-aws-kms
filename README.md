# mod-terraform-aws-kms

Terraform module to create KMS encryption keys.

## Variables

- **profile** - The profile from ~/.aws/credentials file used for authentication. By default it is the default profile.
- **accountID** - ID of your AWS account. It is a required variable normally used in JSON files or while assuming a role.
- **region** - The region for the resources. By default it is eu-west-1.
- **assumeRole** - Enable / Disable role assume. This is disabled by default and normally used for sub organization configuration.
- **assumableRole** - The role the user will assume if assumeRole is enabled. By default, it is OrganizationAccountAccessRole.
- **name** - Name of the KMS used by the tag and json file
- **description** - Description for the key
- **days_before_delete** - The waiting period before the key is deleted in number of days. Must be from 7 to 30 days. By default it is 7 days.
- **enable_key_rotation** - Enable / Disable key rotation. By default it is enabled and for security reasons it should stay that way.
- **multi_region** - Enable / Disable multi region keys. By default it is disabled.

## Example

``` terraform
variable accountID { default = "123456789012"}

module "acm_example" {
  source   = "git::https://github.com/virsas/mod-terraform-aws-kms.git?ref=v3.0.0"

  profile = "default"
  accountID = var.accountID
  region = "us-east-1"

  name = "cloudwatch"
  description = "KMS key for cloudwatch"
}

output "acm_example_arn" {
    value = module.acm_example.arn
}
```

## Outputs

- id
- arn