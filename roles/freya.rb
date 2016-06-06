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
  "recipe[ntp]",
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
  "recipe[tilda]",
  "recipe[terminology]",
  "recipe[atom]",
  "recipe[zeal]",
  "recipe[tmux]",
  "recipe[tmuxinator]",
  "recipe[go]",
  "recipe[xca]",
  "recipe[steam]",
  "recipe[lame]",
  "recipe[sound-juicer]",
  "recipe[bundler]",
  "recipe[gem2rpm]"
  "recipe[telegram]"
)

default_attributes({
  "displaymanager" => {
    "xserver" => "Xorg"
  },
  "windowmanager" => {
    "default_wm" => "gnome"
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
      "tboerger-vim" => "tboerger/homeshick-vim",
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
    "mappings" => {
      "opensuse-13_1" => {
        "interface" => "virbr1",
        "ip" => "192.168.124.10",
        "tcp" => [
          [22131, 22]
        ]
      },
      "opensuse-13_2" => {
        "interface" => "virbr1",
        "ip" => "192.168.124.20",
        "tcp" => [
          [22132, 22]
        ]
      }
    },
    "networks" => {
      "general" => {
        "action" => %w(define start autoboot),
        "mac" => "52:54:00:AB:B1:77",
        "bridge" => "virbr1",
        "ip" => "192.168.124.1",
        "netmask" => "255.255.255.0",
        "dhcp_enable" => true,
        "dhcp_hosts" => [
          {
            "mac" => "52:54:00:77:77:70",
            "name" => "opensuse-13-1",
            "ip" => "192.168.124.10"
          },
          {
            "mac" => "52:54:00:77:77:71",
            "name" => "opensuse-13-2",
            "ip" => "192.168.124.20"
          }
        ]
      }
    },
    "nodes" => {
      "opensuse-13.1" => {
        "action" => %w(define),
        "memory" => 2048,
        "cpus" => 4,
        "disks" => [
          {
            "type" => "file",
            "download" => "http://vagrant.webhippie.de/opensuse-13.1-0.0.1.qcow2",
            "source" => "/var/lib/libvirt/images/opensuse-13.1.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "general",
            "mac" => "52:54:00:77:77:70"
          }
        ]
      },
      "opensuse-13.2" => {
        "action" => %w(define),
        "memory" => 2048,
        "cpus" => 4,
        "disks" => [
          {
            "type" => "file",
            "download" => "http://vagrant.webhippie.de/opensuse-13.2-0.0.1.qcow2",
            "source" => "/var/lib/libvirt/images/opensuse-13.2.qcow2",
            "target" => "vda"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "general",
            "mac" => "52:54:00:77:77:71"
          }
        ]
      }
    }
  }
})

override_attributes({})
