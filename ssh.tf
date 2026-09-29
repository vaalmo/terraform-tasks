resource "aws_key_pair" "this" {
  key_name   = local.keypair_name
  public_key = var.ssh_key

  tags = merge(var.tags, {
    Name = local.keypair_name
  })
}
