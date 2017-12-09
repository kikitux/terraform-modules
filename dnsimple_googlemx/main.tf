variable dnsimple_account {}
variable dnsimple_domain {}
variable dnsimple_token {}
variable ttl {}

variable "mx_server_domains" {
  type = "list"
  default = [
    "aspmx.l.google.com",
    "alt1.aspmx.l.google.com",
    "alt2.aspmx.l.google.com",
    "alt3.aspmx.l.google.com",
    "alt4.aspmx.l.google.com",
  ]
}

resource "dnsimple_record" "root_googlemx" {
  count = "${length(var.mx_server_domains)}"
  domain = "${var.dnsimple_domain}"
  name = "@"
  value = "${var.mx_server_domains[count.index]}"
  priority = "${count.index*10 + 10}"
  type = "MX"
  ttl = "${var.ttl}"
}

