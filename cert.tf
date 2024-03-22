resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 3072
}

resource "tls_cert_request" "this" {
  private_key_pem = tls_private_key.this.private_key_pem
  dns_names       = [local.block_name, local.internal_subdomain]

  subject {
    common_name  = local.internal_subdomain
    organization = coalesce(var.organization, lookup(local.ca_subject, "organization", ""))
  }
}

resource "tls_locally_signed_cert" "this" {
  cert_request_pem      = tls_cert_request.this.cert_request_pem
  ca_private_key_pem    = local.ca_private_key_pem
  ca_cert_pem           = local.ca_cert_pem
  validity_period_hours = var.valid_hours

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "client_auth",
  ]
}
