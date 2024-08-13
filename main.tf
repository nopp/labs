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
    command = "uname -a"
  }
}
