name "freya"
description "Workstation freya"

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
  "recipe[virtmanager]",
  "recipe[kfilebox]",
  "recipe[kdiff3]",
  "recipe[crowbar]"
)

default_attributes({})
override_attributes({})
