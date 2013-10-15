#!/bin/bash

if [ $EUID -ne 0 ]; then
  if [ -f /usr/bin/sudo ]; then
    sudo bash $0
    exit $!
  else
    echo "Please run as root!" 1>&2
    exit 1
  fi
fi

echo "Installing mygusteau..."

if [ -f /etc/SuSE-release ]; then
  if [ ! -f /usr/bin/chef-client ]; then
    sudo rpm -Uvh https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-11.6.2-1.el6.x86_64.rpm
  fi
fi

if [ -f /etc/debian_version ]; then
  if [ ! -f /usr/bin/chef-client ]; then
    curl -L https://www.opscode.com/chef/install.sh | bash
  fi
fi

if [ -f /usr/bin/sw_vers ]; then
  if [ ! -f /usr/bin/chef-client ]; then
    curl -L https://www.opscode.com/chef/install.sh | bash
  fi
fi

if [ ! -f /opt/chef/embedded/bin/gusteau ]; then
  /opt/chef/embedded/bin/gem install gusteau
fi

echo "...done!"
