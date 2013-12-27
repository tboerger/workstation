name "freya"
description "Workstation freya"

run_list(
  "role[basics]",
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
  "recipe[kfilebox]",
  "recipe[kdiff3]"
)

default_attributes({})
override_attributes({})
