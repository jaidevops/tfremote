variable "name" {
    type = string
    description = "Virtual network name"
}

variable "rg_name" {
    type = string
    description = "Resource group name"
}

variable "location" {
    type = string
    description = "location"
}

variable "env" {
    type = string
    description = "environment"
}

variable "project" {
    type = string
    description = "project tag name"
}

variable "vnet_cidr" {
    type = list(string)
    description = "virtual network cidr"
}