#!/bin/sh

## Force a puppet update
##  1) Stop service
##  2) Run puppet in debug mode
##  3) Start service

# Must run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

service puppet stop
puppetd --debug --no-daemon --test
service puppet start

echo "Refreshed puppet client and restarted service."
