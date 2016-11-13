#!/bin/bash

set -e

groupadd --gid $GRP_ID -r local -o
useradd --system --uid=$USR_ID --gid=$GRP_ID --home-dir /home/local local -o

mkdir /home/local
chown local:local /home/local

sudo -H -u local bash -c jupyter notebook
