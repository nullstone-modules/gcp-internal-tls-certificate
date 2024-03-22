output "secrets" {
  value = [
    {
      name  = var.tls_key_env_var
      value = base64encode(tls_private_key.this.private_key_pem)
    }
  ]
}

output "env" {
  value = [
    {
      name  = var.tls_cert_env_var
      value = base64encode(tls_locally_signed_cert.this.cert_pem)
    }
  ]
}
