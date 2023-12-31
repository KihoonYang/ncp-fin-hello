variable "APP_NAME" {
  type = string
}

variable "ENV" {
  type = string
}

variable "SUBNET_LIST" {
  default = {}
}

variable "SERVER_LIST" {
  default = {}
}

variable "INSTANCE_LIST" {
  default = {}
}

variable "ACG_LIST" {
  default = {}
}

variable "ZONE" {
  type = string
}

