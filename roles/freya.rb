name "freya"
description "Workstation freya"

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
  #"recipe[vagrant]",
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
    "nodes" => {
      "build-ubuntu" => {
        "action" => %w(define),
        "memory" => 2048,
        "cpus" => 8,
        "disks" => [
          {
            "type" => "file",
            "download" => "http://vagrant.webhippie.de/kvm/ubuntu-12.04-amd64-minimal.qcow2",
            "source" => "/var/lib/libvirt/images/build-ubuntu.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "default"
          }
        ]
      },
      "build-ubuntu-test" => {
        "action" => %w(define),
        "memory" => 2048,
        "cpus" => 8,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/build-ubuntu-test.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "default"
          }
        ]
      },

      "build-opensuse" => {
        "action" => %w(define),
        "memory" => 2048,
        "cpus" => 8,
        "disks" => [
          {
            "type" => "file",
            "download" => "http://vagrant.webhippie.de/kvm/opensuse-13.1-amd64-minimal.qcow2",
            "source" => "/var/lib/libvirt/images/build-opensuse.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "default"
          }
        ]
      },
      "build-opensuse-test" => {
        "action" => %w(define),
        "memory" => 2048,
        "cpus" => 8,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/build-opensuse-test.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "default"
          }
        ]
      }
    }
  }
})

override_attributes({})
