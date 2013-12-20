name "mimir"
description "Workstation mimir"

run_list(
  "role[basics]",
  "recipe[suse]",
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
  "recipe[kfilebox]",
  "recipe[kdiff3]",
  "recipe[crowbar]"
)

default_attributes({
  "crowbar" => {
    "nodes" => {
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
