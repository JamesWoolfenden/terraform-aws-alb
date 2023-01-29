variable "lb_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "tags" {
  type        = map(any)
  description = "Map for tags"
}
