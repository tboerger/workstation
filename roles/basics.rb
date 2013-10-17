name "basics"
description "Basics role"

run_list(
  "role[vendor]",
  "recipe[locate]"
)

default_attributes({})
override_attributes({})
