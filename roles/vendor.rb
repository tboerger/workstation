name "vendor"
description "Vendor role"

run_list(
  "recipe[chef-solo-search]"
)

default_attributes({})
override_attributes({})
