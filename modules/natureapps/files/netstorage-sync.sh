#!/bin/bash

## This file is managed by puppet, check the IT puppet-modules repo
##  natureapps/manifests/fileserver.pp

DIRECTORY_TO_SYNC=/usr/fs/Web/NPG/multimedia
AKAMAI_SSH_USER=sshacs
AKAMAI_HOST=naturepub.upload.akamai.com
AKAMAI_ROOT_DIR=24662
AKAMAI_DEST_DIR=multimedia

if [ -d $DIRECTORY_TO_SYNC ]; then
    rsync -avzl -e ssh $DIRECTORY_TO_SYNC/* $AKAMAI_SSH_USER@$AKAMAI_HOST:/$AKAMAI_ROOT_DIR/$AKAMAI_DEST_DIR/
fi
