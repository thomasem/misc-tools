#!/usr/bin/env bash

# Place at /bin/password or somewhere on your environment PATH, give execute permissions and use inline like:
# `$ cmd -u username -p $(password)`

read -s -p "Enter Secret: " pass
echo $pass
