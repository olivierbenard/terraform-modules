# terraform-modules
Repository holding reusable terraform modules.

You can refer at the modules stored in this repository from other terraform modules stored in other repositories using the `source` attribute of your local `module` terraform block.

For instance, if you want to re-use the `local_file` module in your local terraform configuration files:

    module "local_files" {
        source = "git::ssh://git@github.com/olivierbenard/terraform-modules.git//tf-local-file?ref=master"
        for_each = toset(["1", "2", "3"])
        filename = "files/my_file_${each.value}.txt"
        content = "This is the content of file ${each.value}."
    }
