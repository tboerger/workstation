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
      "cloudx-node4" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5901,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloudx-node4.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "bridge",
            "source" => "virbr1",
            "target" => "vnet4"
          }
        ]
      },
      "cloudx-node5" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5901,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloudx-node5.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "bridge",
            "source" => "virbr1",
            "target" => "vnet5"
          }
        ]
      }
    }
  }
})

override_attributes({})
