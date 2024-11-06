variable "name" {
    type = string
    description = "Storage account name"
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

variable "tier" {
    type = string
    description = "Storage account tier"
}

variable "replica_type" {
    type = string
    description = "Storage Replication type"
}

variable "rg_name" {
    type = string
    description = "Resource group Name"
}

variable "blob1_name" {
    type = string
    description = "blob Name"
}

variable "ip_rules" {
    type = list(string)
    description = "IPs whiteist"
}

variable "subnet_ids" {
    type = list(string)
    description = "subnet list ids"
}

variable "pdns_id" {
    type = list(string)
    description = "private dns ids"
}

variable "pesub1_id" {
    type = string
    description = "private dns ids"
}

variable "pe01_name" {
    type = string
    description = "private endpoint Name"
}

variable "pr_scname" {
    type = string
    description = "private service connection Name"
}