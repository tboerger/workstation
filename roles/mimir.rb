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
  "recipe[pidgin]",
  "recipe[osc]",
  "recipe[kvm]",
  "recipe[libvirt]",
  "recipe[virtualbox]",
  "recipe[vagrant]",
  "recipe[packer]",
  "recipe[skype]",
  "recipe[sublime]",
  "recipe[virtmanager]",
  "recipe[mpd]",
  "recipe[nvidia]",
  "recipe[parcellite]",
  "recipe[x11utils]",
  "recipe[dropbox]",
  "recipe[lightdm]",
  "recipe[i3]",
  "recipe[mumble]",
  "recipe[nginx]",
  "recipe[apps]"
)

default_attributes({
  "virtualbox" => {
    "users" => %w(tboerger)
  },
  "vagrant" => {
    "mapping" => {
      "tboerger" => "/home/tboerger"
    }
  },
  "nginx" => {
    "apps" => %w(),
    "user" => "tboerger",
    "group" => "suse"
  },
  "libvirt" => {
    "nodes" => {
      # "build-ubuntu" => {
      #   "action" => %w(define),
      #   "memory" => 2048,
      #   "cpus" => 8,
      #   "disks" => [
      #     {
      #       "type" => "file",
      #       "download" => "http://vagrant.webhippie.de/kvm/ubuntu-12.04-amd64-minimal.qcow2",
      #       "source" => "/var/lib/libvirt/images/build-ubuntu.qcow2",
      #       "target" => "vda"
      #     }
      #   ],
      #   "interfaces" => [
      #     {
      #       "type" => "network",
      #       "source" => "default"
      #     }
      #   ]
      # },
      # "build-ubuntu-test" => {
      #   "action" => %w(define),
      #   "memory" => 2048,
      #   "cpus" => 8,
      #   "disks" => [
      #     {
      #       "type" => "file",
      #       "source" => "/var/lib/libvirt/images/build-ubuntu-test.qcow2",
      #       "target" => "vda"
      #     }
      #   ],
      #   "interfaces" => [
      #     {
      #       "type" => "network",
      #       "source" => "default"
      #     }
      #   ]
      # },

      # "build-opensuse" => {
      #   "action" => %w(define),
      #   "memory" => 2048,
      #   "cpus" => 8,
      #   "disks" => [
      #     {
      #       "type" => "file",
      #       "download" => "http://vagrant.webhippie.de/kvm/opensuse-13.1-amd64-minimal.qcow2",
      #       "source" => "/var/lib/libvirt/images/build-opensuse.qcow2",
      #       "target" => "vda"
      #     }
      #   ],
      #   "interfaces" => [
      #     {
      #       "type" => "network",
      #       "source" => "default"
      #     }
      #   ]
      # },
      # "build-opensuse-test" => {
      #   "action" => %w(define),
      #   "memory" => 2048,
      #   "cpus" => 8,
      #   "disks" => [
      #     {
      #       "type" => "file",
      #       "source" => "/var/lib/libvirt/images/build-opensuse-test.qcow2",
      #       "target" => "vda"
      #     }
      #   ],
      #   "interfaces" => [
      #     {
      #       "type" => "network",
      #       "source" => "default"
      #     }
      #   ]
      # }
    }
  }
})

override_attributes({})
