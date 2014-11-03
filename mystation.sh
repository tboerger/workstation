#!/bin/bash

if [ $EUID -ne 0 ]
then
  if [ -f /usr/bin/sudo ]
  then
    sudo bash $0
    exit $!
  else
    echo "Please run as root!" 1>&2
    exit 1
  fi
fi

NODE=$(hostname -s)

if [ -L $0 ]
then
  ROOT=$(dirname $(readlink $0))
else
  ROOT=$(dirname $0)
fi

while [ ! -f ${ROOT}/nodes/${NODE}.json ]
do
  echo
  echo "Configuration does not exist!"

  echo -n "Node name: "
  read NODE
done

chef-solo -c ${ROOT}/config/solo.rb -j ${ROOT}/nodes/${NODE}.json -N ${NODE}
