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
    description = "environment name"
}

variable "project" {
    type = string
    description = "Project tag name"
}



####################Linux Virtual Machine##########################

variable "vm01_username" {
    type = string
    description = "virtual machine name"
    sensitive   = true
}

variable "vm01_userpswd" {
    type = string
    description = "virtual machine password"
    sensitive   = true
}

variable "nic01_name" {
    type = string
    description = "Network interface Control"
}

variable "ipconf1_name" {
    type = string
    description = "IP configuration name"
}

variable "sub1_id" {
    type = string
    description = "Subnet id"
}


variable "vm01_name" {
    type = string
    description = "Virtual Machine name"
}

variable "vm01_size" {
    type = string
    description = "Virtual Machine size"
}

variable "vm01_publisher" {
    type = string
    description = "Virtual machine publisher"
}

variable "vm01_offer" {
    type = string
    description = "virtual machine os offer"
}

variable "vm01_sku" {
    type = string
    description = "Virtual machine SKU"
}

variable "pubip_name" {
    type = string
    description = "Public IP Name"
}