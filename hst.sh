#!/usr/bin/env bash

# Place at /bin/resolves or somewhere on your environment PATH, give execute permissions and use inline like:
# `$ ssh root@$(hst hostname)`
# This is a light tool for Mac OS X to handle resolving `/etc/hosts` entries that you don't want on a bastion server.


dscacheutil -q host -a name $@ | grep ip_address | awk '{print $NF}'
