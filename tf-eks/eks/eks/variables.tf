variable "cluster_name" {
    type = string
}

variable "vpc_cidr" {
    type = string
    default = "192.168.0.0/16"
}

variable "subnet1_cidr" {
    type = string
    default = "192.168.16.0/20"
}

variable "subnet2_cidr" {
    type = string
    default = "192.168.32.0/20"
}
