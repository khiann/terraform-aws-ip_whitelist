![Terraform GitHub Actions](https://github.com/tlzproject/terraform-aws-ip_whitelist/workflows/Terraform%20GitHub%20Actions/badge.svg)

## Customer Public IP Space Whitelisting Module

This module is designed to provide a centrally maintained list of public IP space owned and operated by Customer to allow for easy IP whitelists/blacklists of Customer Public IP space.

This is of particular use when needing to:
1. Applying security groups to items in public subnets (with public IPs) to prevent access from people outside of Customer
1. IP whitelists for AWS WAF rulesets


Example usage

```
module "ip-whitelist" {
  source = "localterraform.com/TLZ-Demo/ip_whitelist"
  version = "~> 0.1.0"
}

resource "aws_security_group" "name" {
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["${module.ip-whitelist.cidr}"]
  }
}
```

See outputs for other available output types.
