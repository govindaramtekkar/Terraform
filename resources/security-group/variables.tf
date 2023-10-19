variable "sg_name" {
  description = "name of security group"
  type        = string
}
variable "sg_tag" {
  description = "tags for  security group"
  type        = map(string)
}

variable "vpc_id" {
  description = "vpc id for security group"
  type        = string

}

variable "ingress" {
  description = "ingress rule"
  type        = list(any)
}


variable "egress" {
  description = "egress rule"
  type        = list(any)
}
