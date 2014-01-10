name "mimir"
description "Workstation mimir"

run_list(
  "role[basics]",
  "recipe[account]",
  "recipe[users]",
  "recipe[workstation]",
  "recipe[icecream]",
  "recipe[chrome]",
  "recipe[irssi]",
  "recipe[centerim]",
  "recipe[osc]",
  "recipe[libvirt]",
  "recipe[vagrant]",
  "recipe[skype]",
  "recipe[sublime]",
  "recipe[rubymine]",
  "recipe[kvm]",
  "recipe[virtmanager]",
  "recipe[kfilebox]",
  "recipe[kdiff3]",
  "recipe[nginx]",
  "recipe[apps]"
)

default_attributes({
  "nginx" => {
    "apps" => %w(),
    "user" => "tboerger",
    "group" => "suse"
  },
  "libvirt" => {
    "networks" => {
      "cloud" => {
        "action" => %w(define start autoboot),
        "mac" => "52:54:00:AB:B1:77",
        "bridge" => "virbr1",
        "ip" => "192.168.124.1",
        "netmask" => "255.255.255.0",
        "dhcp_enable" => true,
        "dhcp_hosts" => [
          {
            "mac" => "52:54:00:77:77:70",
            "name" => "crowbar.virtual.cloud.suse.de",
            "ip" => "192.168.124.10"
          }
        ]
      }
    },
    "nodes" => {
      "cloud3-admin" => {
        "action" => %w(define),
        "memory" => 2048,
        "cpus" => 8,
        "vnc" => 5900,
        "disks" => [
          {
            "type" => "file",
            "download" => "http://tinyurl.com/suse-cloud-3-dev-0-0-8",
            "source" => "/var/lib/libvirt/images/cloud3-admin.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud",
            "mac" => "52:54:00:77:77:70"
          }
        ]
      },
      "cloud3-node1" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5901,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node1.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud3-node2" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5902,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node2.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud3-node3" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5903,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node3.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud3-node4" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5904,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node4.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud3-node5" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5905,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node5.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud2-admin" => {
        "action" => %w(define),
        "memory" => 2048,
        "cpus" => 8,
        "vnc" => 5900,
        "disks" => [
          {
            "type" => "file",
            "download" => "http://tinyurl.com/suse-cloud-2-dev-0-0-8",
            "source" => "/var/lib/libvirt/images/cloud2-admin.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud",
            "mac" => "52:54:00:77:77:70"
          }
        ]
      },
      "cloud2-node1" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5901,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node1.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud2-node2" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5902,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node2.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud2-node3" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5903,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node3.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud2-node4" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5904,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node4.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud2-node5" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5905,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node5.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      }
    }
  }
})

override_attributes({})
