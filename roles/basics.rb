name "basics"
description "Basics role"

run_list(
  "recipe[chef-solo-search]",
  "recipe[hosts]",
  "recipe[locales]",
  "recipe[timezone]",
  "recipe[sshkey]",
  "recipe[sysctl]",
  "recipe[git]",
  "recipe[subversion]",
  "recipe[ruby]",
  "recipe[htop]",
  "recipe[screen]",
  "recipe[vim]",
  "recipe[nano]",
  "recipe[cronlist]",
  "recipe[sqlite]",
  "recipe[sudo]",
  "recipe[ntp]",
  "recipe[openssh]",
  "recipe[readline]"
)

default_attributes({

})

override_attributes({

})
