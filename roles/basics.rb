name "basics"
description "Basics role"

run_list(
  "role[vendor]",
  "recipe[locate]",
  "recipe[git]",
  "recipe[subversion]",
  "recipe[htop]",
  "recipe[screen]",
  "recipe[vim]",
  "recipe[nano]"
)

default_attributes({})
override_attributes({})
