root_path = File.expand_path(
  '../..',
  __FILE__
)

cookbook_copyright 'Thomas Boerger'
cookbook_email 'thomas@webhippie.de'
cookbook_license 'apachev2'

cookbook_path [
  File.join(root_path, 'vendor'),
  File.join(root_path, 'cookbooks')
]
