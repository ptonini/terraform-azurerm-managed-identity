variable "name" {}

variable "rg" {
  type = object({
    name     = string
    location = string
    id       = string
  })
}

variable "scopes" {
  type = map(object({
    scope     = string
    role_name = string
  }))
  default = {}
}
