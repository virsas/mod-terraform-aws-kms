variable "profile" {
  description           = "The profile from ~/.aws/credentials file used for authentication. By default it is the default profile."
  type                  = string
  default               = "default"
}

variable "accountID" {
  description           = "ID of your AWS account. It is a required variable normally used in JSON files or while assuming a role."
  type                  = string

  validation {
    condition           = length(var.accountID) == 12
    error_message       = "Please, provide a valid account ID."
  }
}

variable "region" {
  description           = "The region for the resources. By default it is eu-west-1."
  type                  = string
  default               = "eu-west-1"
}

variable "assumeRole" {
  description           = "Enable / Disable role assume. This is disabled by default and normally used for sub organization configuration."
  type                  = bool
  default               = false
}

variable "assumableRole" {
  description           = "The role the user will assume if assumeRole is enabled. By default, it is OrganizationAccountAccessRole."
  type                  = string
  default               = "OrganizationAccountAccessRole"
}

variable "json_path" {
  description           = "By default the json files are located in ./json/kms directory with names *NAME*.json."
  type                  = string
  default               = "./json/kms"
}

variable "name" {
  description           = "Name of the KMS used by the tag and json file"
  type                  = string
}

variable "description" {
  description           = "Description for the key"
  type                  = string
}

variable "days_before_delete" {
  description           = "The waiting period before the key is deleted in number of days. Must be from 7 to 30 days. By default it is 7 days."
  type                  = number
  default               = 7
}

variable "enable_key_rotation" {
  description           = "Enable / Disable key rotation. By default it is enabled and for security reasons it should stay that way,"
  type                  = bool
  default               = true
}

variable "multi_region" {
  description           = "Enable / Disable multi region keys. By default it is disabled"
  type                  = bool
  default               = false
}