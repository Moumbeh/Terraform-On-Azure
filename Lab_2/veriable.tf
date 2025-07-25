# current subscription
variable "subscription_id" {
  type = string
}

# Business unit or application
variable "application_name" {
  type = string
}

variable "business_unit" {
  type    = string
  default = "hr"
}
# Environment
variable "environment_name" {
  type = string
}

# location for deployment
variable "primary_location" {
  type = string
}

### virtual network
variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "web-subnet" {
  type = string
}

variable "web-subnet-address_prefixes" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}
variable "app-subnet" {
  type = string
}

variable "app-subnet-address_prefixes" {
  type = list(string)
}
variable "db-subnet" {
  type = string
}

variable "db-subnet-address_prefixes" {
  type = list(string)
}

variable "bastion-subnet" {
  type = string
}

variable "bastion-subnet-address_prefixes" {
  type = list(string)
}