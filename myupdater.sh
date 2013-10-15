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

echo "Initalizing workstation..."
echo

if [ -f /etc/SuSE-release ]; then
  if [ ! -f /usr/bin/chef-client ]; then
    sudo rpm -Uvh https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-11.6.2-1.el6.x86_64.rpm
  fi

  [[ ! -f /usr/bin/git ]] && zypper in git-core
fi

if [ -f /etc/debian_version ]; then
  if [ ! -f /usr/bin/chef-client ]; then
    curl -L https://www.opscode.com/chef/install.sh | bash
  fi

  [[ ! -f /usr/bin/git ]] && aptitude install git-core
fi

if [ -f /usr/bin/sw_vers ]; then
  if [ ! -f /usr/bin/chef-solo ]; then
    curl -L https://www.opscode.com/chef/install.sh | bash
  fi
fi

if [ -d /opt/workstation ]; then
  cd /opt/workstation && git stash && git pull --force
else
  git clone https://github.com/tboerger/workstation.git /opt/workstation
fi

if [ -d /opt/workstation/cookbooks ]; then
  cd /opt/workstation/cookbooks && git stash && git pull --force
else
  git clone https://github.com/tboerger/cookbooks.git /opt/workstation/cookbooks
fi

ln -sf /opt/workstation/mystation.sh /usr/local/bin/mystation
ln -sf /opt/workstation/myupdater.sh /usr/local/bin/myupdater

echo
echo "...done!"
echo "You can provision the workstation with: /usr/local/bin/mystation"
