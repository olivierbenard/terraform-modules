# tf-airflow-variable
Terraform module to create Airflow variables to be stored on Google Secrets Manager.

## Usage in Terraform
To integrate this module in your terraform code, add the following block to your configuration:

    module "airflow_variable" {
        source = "git::ssh://git@github.com/olivierbenard/terraform-modules.git//tf-airflow-variable?ref=master"
        airflow_variable_name = "<variable-name>"
        airflow_variable_value = "<variable-value>"
        airflow_variable_location = "<variable-location>"
    }

**Note:** For this to work, you will also have to configure the [Provider Requirements](required_providers) somewhere in your code e.g. `versions.tf`.

    terraform {
        required_providers {
            google_cloud = {
                version = "~> 4.17.0"
            }
        }
    }

    provider google_cloud {
        region = "<google_region>"
        project = "<google_project>"
    }

## Troubleshooting
For your DAGs running on Airflow Google Cloud Composer to be able to see the variables you store on Google Cloud Secret Manager, you need to configure Secret Manager on your environment. Follow the official [documentation](https://cloud.google.com/composer/docs/composer-2/configure-secret-manager).

You can then access the variables from your DAGs using the following python lines:

```python
from airflow.models import Variable
RETRIEVED_VARIABLE = "{{var.value.my_variable}}" # or Variable.get("my_variable")
```
