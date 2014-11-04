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

CHEF_DK_URL=https://opscode-omnibus-packages.s3.amazonaws.com
CHEF_DK_VERSION=${CHEF_DK_VERSION:-0.3.0-1}   

echo "Initalizing workstation..."
echo

if [ -f /usr/bin/sw_vers ]
then
  if [ ! -f /usr/bin/chef-solo ]
  then
    curl -so /tmp/chefdk.dmg ${CHEF_DK_URL}/mac_os_x/10.8/x86_64/chefdk-${CHEF_DK_VERSION}.dmg

    hdiutil mount /tmp/chefdk.dmg &> /dev/null
    installer -pkg /Volumes/Chef\ Development\ Kit/chefdk-${CHEF_DK_VERSION}.pkg -target /
    hdiutil unmount /Volumes/Chef\ Development\ Kit &> /dev/null
  fi
fi

if [ -f /etc/SuSE-release ]
then
  if [ ! -f /usr/bin/chef-client ]
  then
    zypper -q in -y ${CHEF_DK_URL}/el/6/x86_64/chefdk-${CHEF_DK_VERSION}.x86_64.rpm
  fi

  if [[ ! -f /usr/bin/git ]]
  then
    zypper -q in -y git-core
  fi
fi

if [ -f /etc/debian_version ]
then
  if [ ! -f /usr/bin/chef-client ]
  then

    #
    # TODO: Detect debian and download deb package
    # ${CHEF_DK_URL}/debian/6/x86_64/chefdk_${CHEF_DK_VERSION}_amd64.deb
    #

    #
    # TODO: Detect ubuntu and download deb package
    # ${CHEF_DK_URL}/ubuntu/12.04/x86_64/chefdk_${CHEF_DK_VERSION}_amd64.deb
    #

    # dpkg -i /tmp/chefdk.deb
  fi

  [[ ! -f /usr/bin/git ]] && aptitude install -y git-core
fi

if [ -d /opt/workstation ]
then
  cd /opt/workstation && git stash && git pull --force && git submodule update --init --recursive
else
  git clone https://github.com/tboerger/workstation.git /opt/workstation
  cd /opt/workstation && git submodule update --init --recursive
fi

pushd /opt/workstation &> /dev/null
rm -rf cookbooks &> /dev/null
berks vendor cookbooks
popd &> /dev/null

ln -sf /opt/workstation/mystation.sh /usr/local/bin/mystation
ln -sf /opt/workstation/myupdater.sh /usr/local/bin/myupdater

echo
echo "...done!"
echo "You can provision the workstation with: /usr/local/bin/mystation"
