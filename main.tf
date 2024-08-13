locals {
  opa = "test"
}

data "null_data_source" "values" {
  inputs = {
    all_server_ips = "woooow"
  }
}

resource "null_resource" "example" {
  triggers = {
    id = data.null_data_source.values.outputs["all_server_ips"]
  }
  provisioner "local-exec" {
    working_dir = "/tmp"
    command = "echo ${local.opa} > test"
  }
  provisioner "local-exec" {
    command = "uname -a"
  }
}
