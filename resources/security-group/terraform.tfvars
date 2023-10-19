
vpc_id  = "vpc-0e5bf8cc59fc1789a"
sg_name = "test-sg"
sg_tag = {
  Name = "test security group"
}

ingress = [
  {
    from_port                = 80
    to_port                  = 80
    protocol                 = "tcp"
    cidr_blocks              = [""]
    source_security_group_id = "sg-0047a56a9231e7c38"
  }
  ,

  {
    from_port                = 22
    to_port                  = 22
    protocol                 = "tcp"
    cidr_blocks              = ["0.0.0.0/0"]
    source_security_group_id = null
  }

]
egress = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]