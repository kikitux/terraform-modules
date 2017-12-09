variable dnsimple_account {}
variable dnsimple_domain {}
variable dnsimple_token {}
variable ttl {}

variable "gh_ip" {
  type = "list"
  default = [
    "192.30.252.153",
    "192.30.252.154"
  ]
}

resource "dnsimple_record" "root_gh" {
  count = "${length(var.gh_ip)}"
  domain = "${var.dnsimple_domain}"
  name   = ""
  value  = "${var.gh_ip[count.index]}"
  type   = "A"
  ttl    = "${var.ttl}"
}
