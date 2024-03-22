data "ns_connection" "ca" {
  name     = "ca"
  contract = "datastore/gcp/ca:internal"
}

data "google_secret_manager_secret_version" "root_private_key" {
  secret    = data.ns_connection.ca.outputs.root_key_secret_id
}

locals {
  ca_private_key_pem = data.google_secret_manager_secret_version.root_private_key.secret_data
  ca_cert_pem        = data.ns_connection.ca.outputs.root_cert_pem
  ca_subject         = data.ns_connection.ca.outputs.root_subject
}
