
resource "tls_private_key" "nautilus_pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "nautilus_kp" {
  key_name   = "nautilus-kp"
  public_key = tls_private_key.nautilus_pk.public_key_openssh
}

# Step 3: Save the private key locally
resource "local_file" "save_private_key" {
  content  = tls_private_key.nautilus_pk.private_key_pem
  filename = "/home/bob/nautilus-kp.pem"
}
