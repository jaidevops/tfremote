########################### Virtual network ###############################################
variable "vnet_name" {
    type = string
    description = "Resource group name"
}

############################# Resource Group Name ########################################
variable "rg_name" {
    type = string
    description = "Resource group location"
}

############################# Subnet 01 - Virtual Machine #################################
variable "sub1_name" {
    type = string
    description = "subnet01 name"
}

variable "sub1_cidr" {
    type = list(string)
    description = "subnet01 cidr"
}

variable "nsg01_id" {
    type = string
    description = "nsg id"
}



############################ Subnet 02 - Virtual machine 2 ##################################

variable "sub2_name" {
    type = string
    description = "subnet02 name"
}

variable "sub2_cidr" {
    type = list(string)
    description = "subnet02 cidr"
}

variable "nsg02_id" {
    type = string
    description = "nsg id"
}