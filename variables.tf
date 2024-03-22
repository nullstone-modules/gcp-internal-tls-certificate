variable "app_metadata" {
  description = <<EOF
Nullstone automatically injects metadata from the app module into this module through this variable.
This variable is a reserved variable for capabilities.
EOF

  type    = map(string)
  default = {}
}

locals {
  internal_subdomain = var.app_metadata["internal_subdomain"]
}

variable "tls_cert_env_var" {
  type        = string
  default     = "TLS_CERT"
  description = "The name of the environment variable to inject the TLS cert pem"
}

variable "tls_key_env_var" {
  type        = string
  default     = "TLS_KEY"
  description = "The name of the environment variable to inject the TLS private key pem"
}

variable "valid_hours" {
  type        = number
  default     = 87600
  description = "The number of hours the TLS certificate is valid. By default, 87600 hours or 10 years."
}

variable "organization" {
  type        = string
  default     = ""
  description = "The name of the organization issuing the root certificate. If left blank, will use organization from certificate authority."
}
