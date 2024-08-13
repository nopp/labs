data "null_data_source" "values" {
  inputs = {
    all_server_ips = concat(["a", "b"], ["c", "d"])
  }
}

resource "null_resource" "example" {
  
  triggers = {
    instances = data.null_data_source.values.outputs["all_server_ips"]
  }
  provisioner "local-exec" {
    command = "uname -a"
  }
}
