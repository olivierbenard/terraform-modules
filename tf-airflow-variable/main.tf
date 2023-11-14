locals {
  airflow-variable-prefix      = "airflow-variables"
  default-prefix-key-separator = "-"
}

resource "google_secret_manager_secret" "airflow_variable" {

  secret_id = join(local.default-prefix-key-separator, [local.airflow-variable-prefix, var.airflow_variable_name])

  replication {
    user_managed {
      replicas {
        location = var.airflow_variable_location
      }
    }
  }
}

resource "google_secret_manager_secret_version" "airflow_variable" {
  secret      = google_secret_manager_secret.airflow_variable.id
  secret_data = var.airflow_variable_value
}
