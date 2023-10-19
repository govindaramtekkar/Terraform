resource "aws_security_group" "this" {
  name   = var.sg_name
  vpc_id = var.vpc_id

  tags = var.sg_tag

}

resource "aws_security_group_rule" "this-ingress" {
  count                    = length(var.ingress)
  type                     = "ingress"
  from_port                = var.ingress[count.index]["from_port"]
  to_port                  = var.ingress[count.index]["to_port"]
  protocol                 = var.ingress[count.index]["protocol"]
  cidr_blocks              = var.ingress[count.index]["cidr_blocks"] != [""] ? var.ingress[count.index]["cidr_blocks"] : null
  source_security_group_id = var.ingress[count.index]["source_security_group_id"] != [""] ? var.ingress[count.index]["source_security_group_id"] : null
  security_group_id        = aws_security_group.this.id
}


resource "aws_security_group_rule" "this-egress" {
  count             = length(var.egress)
  type              = "egress"
  from_port         = var.egress[count.index]["from_port"]
  to_port           = var.egress[count.index]["to_port"]
  protocol          = var.egress[count.index]["protocol"]
  cidr_blocks       = var.egress[count.index]["cidr_blocks"]
  security_group_id = aws_security_group.this.id

}



 