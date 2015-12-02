#!/usr/bin/env bash

if [ $EUID -ne 0 ]
then
  if [ -f /usr/bin/sudo ]
  then
    sudo -E -H $0 $@
    exit $!
  else
    echo "Please run as root!" 1>&2
    exit 1
  fi
fi

if [ -L $0 ]
then
  ROOT=$(dirname $(readlink -e $0))
else
  if [ $0 == "bash" ]
  then
    ROOT=${ROOT:-/opt/workstation}
  else
    ROOT=$(realpath -e $(dirname $0))
  fi
fi

CHEFDK_URL=${CHEFDK_URL:-https://opscode-omnibus-packages.s3.amazonaws.com}
CHEFDK_VERSION=${CHEFDK_VERSION:-0.10.0-1}

REPOSITORY_URL=${REPOSITORY_URL:-https://github.com/tboerger/workstation.git}

if [ -f /usr/bin/sw_vers ]
then
  if [ ! -f /usr/bin/chef-solo ]
  then
    echo "--> Install ChefDK"
    (
      curl -so /tmp/chefdk.dmg ${CHEFDK_URL}/mac_os_x/10.8/x86_64/chefdk-${CHEFDK_VERSION}.dmg

      hdiutil mount /tmp/chefdk.dmg &> /dev/null
      installer -pkg /Volumes/Chef\ Development\ Kit/chefdk-${CHEFDK_VERSION}.pkg -target /
      hdiutil unmount /Volumes/Chef\ Development\ Kit &> /dev/null
    ) 2>&1 | sed 's/^/    /'
  fi
fi

if [ -f /etc/SuSE-release ]
then
  if [ ! -f /usr/bin/chef-solo ]
  then
    echo "--> Install ChefDK"
    (
      zypper --no-gpg-checks -q in -y ${CHEFDK_URL}/el/7/x86_64/chefdk-${CHEFDK_VERSION}.el7.x86_64.rpm
    ) 2>&1 | sed 's/^/    /'
  fi

  if [[ ! -f /usr/bin/git ]]
  then
    echo "--> Install Git"
    (
      zypper -q in -y git-core
    ) 2>&1 | sed 's/^/    /'
  fi
fi

if [ -d ${ROOT} ]
then
  if [ $ROOT == "/opt/workstation" ]
  then
    echo "--> Updating itself"
    (
      cd ${ROOT} && git stash && git pull --force && git submodule update --init --recursive
    ) 2>&1 | sed 's/^/    /'
  fi
else
  echo "--> Cloning itself"
  (
    git clone ${REPOSITORY_URL} ${ROOT} && cd ${ROOT} && git submodule update --init --recursive
  ) 2>&1 | sed 's/^/    /'
fi

if [ ! -d ${ROOT}/cookbooks ]
then
  mkdir -p ${ROOT}/cookbooks
fi

while read LINE
do
  IFS=" " read -ra COOKBOOK <<< "$LINE"

  if [ -d ${ROOT}/cookbooks/${COOKBOOK[1]} ]
  then
    echo "--> Updating ${COOKBOOK[0]}"
    (
      cd ${ROOT}/cookbooks/${COOKBOOK[1]} && git stash && git pull --force && git submodule update --init --recursive
    ) 2>&1 | sed 's/^/    /'
  else
    echo "--> Cloning ${COOKBOOK[0]}"
    (
      git clone ${COOKBOOK[0]} ${ROOT}/cookbooks/${COOKBOOK[1]} && cd ${ROOT}/cookbooks/${COOKBOOK[1]} && git submodule update --init --recursive
    ) 2>&1 | sed 's/^/    /'
  fi
done < ${ROOT}/cookbooks.txt

ln -sf ${ROOT}/mystation.sh /usr/local/bin/mystation
ln -sf ${ROOT}/myupdater.sh /usr/local/bin/myupdater

echo "--> Finished"
echo "    Please execute the 'mystation' command"
