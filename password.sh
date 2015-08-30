#!/bin/bash
# Place @ /bin/password or somewhere on your environment PATH
# give execute permissions and use inline like
# `$ cmd -u username -p $(password)`

read -s -p "Enter Password: " pass
echo $pass
