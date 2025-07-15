variable "application_name" {
  type = string
  validation {
    condition     = length(var.application_name) <= 10
    error_message = "application name must be less than or equal to 6"
  }
}

variable "Environment_name" {
  type = string
}

variable "api_keys" {
  type      = string
  sensitive = true
}

variable "instances" {
  type = number
  validation {
    condition     = var.instances > 0 && var.instances < 10
    error_message = "Must be between 1 and 10"
  }
}

variable "enabled" {
  type = bool
}

variable "regions" {
  type = list(string)
}

variable "region-set" {
  type = set(string)
}
variable "region_instance_count" {
  type = map(string)
}

variable "vnet" {
  type = object({
    vnet_name   = string
    subnet_name = string
  })
}