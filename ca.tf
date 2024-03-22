data "ns_connection" "ca" {
  name     = "ca"
  contract = "datastore/aws/ca:internal"
}

data "aws_secretsmanager_secret_version" "root_private_key" {
  secret_id = data.ns_connection.ca.outputs.root_key_secret_id
}

locals {
  ca_private_key_pem = data.aws_secretsmanager_secret_version.root_private_key.secret_string
  ca_cert_pem        = data.ns_connection.ca.outputs.root_cert_pem
  ca_subject         = data.ns_connection.ca.outputs.root_subject
}
