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
      "cloud4-admin" => {
        "action" => %w(define),
        "memory" => 2048,
        "cpus" => 8,
        "vnc" => 5900,
        "disks" => [
          {
            "type" => "file",
            "download" => "http://clouddata.cloud.suse.de/images/SUSE_Cloud_3_Dev.x86_64-0.0.9.qcow2",
            "source" => "/var/lib/libvirt/images/cloud4-admin.qcow2",
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
      "cloud4-node01" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5901,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node01.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node01-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud4-node02" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5902,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node02.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node02-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud4-node03" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5903,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node03.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node03-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud4-node04" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5904,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node04.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node04-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud4-node05" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5905,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node05.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node05-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud4-node06" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5906,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node06.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node06-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud4-node07" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5907,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node07.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node07-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud4-node08" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5908,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node08.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node08-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud4-node09" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5909,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node09.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node09-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud4-node10" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5910,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node10.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud4-node10-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud3-admin" => {
        "action" => %w(define),
        "memory" => 2048,
        "cpus" => 8,
        "vnc" => 5900,
        "disks" => [
          {
            "type" => "file",
            "download" => "http://clouddata.cloud.suse.de/images/SUSE_Cloud_3_Dev.x86_64-0.0.9.qcow2",
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
      "cloud3-node01" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5901,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node01.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node01-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud3-node02" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5902,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node02.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node02-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud3-node03" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5903,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node03.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node03-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud3-node04" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5904,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node04.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node04-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud3-node05" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5905,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node05.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud3-node05-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
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
            "download" => "http://clouddata.cloud.suse.de/images/SUSE_Cloud_2_Dev.x86_64-0.0.9.qcow2",
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
      "cloud2-node01" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5901,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node01.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node01-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud2-node02" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5902,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node02.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node02-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud2-node03" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5903,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node03.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node03-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud2-node04" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5904,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node04.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node04-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },
      "cloud2-node05" => {
        "action" => %w(define),
        "memory" => 1024,
        "cpus" => 4,
        "vnc" => 5905,
        "disks" => [
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node05.qcow2",
            "target" => "vda",
            "size" => "50G"
          },
          {
            "type" => "file",
            "source" => "/var/lib/libvirt/images/cloud2-node05-storage.qcow2",
            "target" => "vdb",
            "size" => "50G"
          }
        ],
        "interfaces" => [
          {
            "type" => "network",
            "source" => "cloud"
          }
        ]
      },

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
      }
    }
  }
})

override_attributes({})
