name "freya"
description "Workstation freya.suse.de"

run_list(
  "role[basics]",

  "recipe[openssl]",
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
  "recipe[x11utils]",
  "recipe[dropbox]",
  "recipe[feh]",
  "recipe[conky]",
  "recipe[dunst]",
  "recipe[windowmanager]",
  "recipe[displaymanager]",
  "recipe[i3]",
  "recipe[yad]",
  "recipe[xrdp]",
  "recipe[docker]",
  "recipe[mumble]",
  "recipe[multimc]",
  "recipe[thunderbird]",
  "recipe[terminology]",
  "recipe[atom]",
  "recipe[zeal]",
  "recipe[go]",
  "recipe[xca]"
)

default_attributes({
  "displaymanager" => {
    "xserver" => "Xorg"
  },
  "windowmanager" => {
    "default_wm" => "i3"
  },
  "openssl" => {
    "organization" => "Thomas Boerger",
    "unit" => "Hostmaster",
    "locality" => "Nuremberg",
    "state" => "Bavaria",
    "country" => "DE",
    "email" => "tboerger@suse.de",
    "expiration" => 1095,
    "self_signing" => true
  },
  "icecream" => {
    "netname" => "AUTOBUILD",
    "scheduler_host" => "icecream.suse.de"
  },
  "users" => {
    "castles" => {
      "tboerger-base" => "tboerger/homeshick-base",
      "tboerger-linux" => "tboerger/homeshick-linux",
      "tboerger-suse" => "tboerger/homeshick-suse"
    }
  },
  "docker" => {
    "users" => %w(tboerger)
  },
  "virtualbox" => {
    "users" => %w(tboerger)
  },
  "vagrant" => {
    "plugins" => %w(
      vagrant-libvirt
      vagrant-vbguest
      vagrant-bindfs
      vagrant-notify
      sahara
    ),
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
    "daemon" => {
      "users" => %w(tboerger),
      "qemu" => {
        "vnc_password" => "qayqay",
        "spice_password" => "qayqay"
      },
    },
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
