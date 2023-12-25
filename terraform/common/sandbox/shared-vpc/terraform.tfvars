firewall_rules = [
  {
    name        = "allow-internal"
    description = null
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["10.128.0.0/9"]
    allow = [
      {
        protocol = "icmp"
        ports    = []
      },
      {
        protocol = "tcp"
        ports    = ["0-65535"]
      },
      {
        protocol = "udp"
        ports    = ["0-65535"]
      }
    ]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  },
  {
    name        = "allow-ssh-from-iap"
    description = null
    direction   = "INGRESS"
    priority    = 1010
    ranges      = ["35.235.240.0/20"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["22"]
      }
    ]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  },
  {
    name        = "allow-ssh-from-bastion"
    description = null
    direction   = "INGRESS"
    priority    = 1020
    ranges      = ["35.235.240.0/20"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["3389"]
      }
    ]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }
]

enabled_services = [
  "compute.googleapis.com",
]