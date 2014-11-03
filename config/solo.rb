root_path = File.expand_path(
  '../..',
  __FILE__
)

cookbook_path [
  File.join(root_path, 'vendor'),
  File.join(root_path, 'cookbooks')
]

data_bag_path File.join(root_path, 'data_bags')
role_path File.join(root_path, 'roles')

checksum_path File.join('/root', '.chef', 'checksum')
file_cache_path File.join('/root', '.chef', 'cache')
file_backup_path File.join('/root', '.chef', 'backup')

cache_options({
  path: File.join('/root', '.chef', 'cache', 'checksums'),
  skip_expires: true
})

log_level :warn

ssl_verify_mode :verify_peer
zypper_check_gpg true
