## Credit https://github.com/jonnyzzz

locals {
  wafs = [
    { type = "IPV4", value = "18.222.75.222/32" }, #Columbus Regus Network
    { type = "IPV4", value = "75.103.5.140/32" },  # Columbus office
    { type = "IPV4", value = "12.161.112.4/32" },  # Eric hotel
    { type = "IPV4", value = "72.21.196.66/32" }   # Seetarama VPN
  ]
}

resource "null_resource" "ipv4" {
  count = length(local.wafs)

  triggers = {

    cidr = "${
      lookup(local.wafs[count.index], "type") == "IPV4"
      ? lookup(local.wafs[count.index], "value")
      : ""
    }"
  }
}

output "cidr" {
  value = [compact(null_resource.ipv4.*.triggers.cidr)]
}

output "waf" {
  value = local.wafs
}
