data "null_data_source" "values" {
  inputs = {
    all_server_ips = concat(
      "192.168.0.10/32",
      "192.168.0.20/32,
    )
  }
}

resource "null_resource" "example" {
  instances = data.null_data_source.values.outputs["all_server_ips"]
}
