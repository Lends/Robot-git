variable bucket_name {
  type        = string
  description = "Bucket name"
}

variable vpc_cidr {
    type = string
    description = "VPC CIDR"
}


variable sub_cidr {
    type = string
    description = "subnet CIDR"
}

variable sub2_cidr {
    type = string
    description = "2nd subnet CIDR"
}

variable sg_name {
    type = string
    description = "security group name"
}

variable port {
    type = number
    description = "allowing ports"
}

variable storage {
    type = number
    description = "storage size"
}

variable name_db {
    type = string
    description = "name of data base"
}

variable engine {
    type = string
    description = "database engine"
}

variable engine_version {
    type = number
    description = "db engine version"
}

variable instance_class {
    type = string
    description = "db instance class"
}

variable username {
    type = string
    description = "db username"
}

variable password {
    type = string
    description = "db password"
}