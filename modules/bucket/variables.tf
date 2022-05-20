variable "bucket_name" {
    type    = string
    default = null
}

variable "bucket_location" {
    type    = string
    default = null
}
variable "bucket_uniform_level_access" {
    type    = bool
    default = false 
}

variable "bucket_origin_list" {
  type        = list
  default = null
}

variable "bucket_method" {
  type        = list
    default = null
}

variable "bucket_reponse_header" {
type        = list
default = null
}

variable "bucket_max_age_seconds" {
    type    = number
    default = "3600"
}

variable "bucket_role" {
    type    = string
    default = null
}

variable "bucket_entity" {
    type    = string
    default = null
}
