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
    command = <<EOT
      "echo ${local.opa} > /tmp/test"
      "uname -a"
    EOT
  }
}
