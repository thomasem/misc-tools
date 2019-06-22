#!/usr/bin/env bash

# Simple helper for wmctrl focus for varying window titles but persistent executable names in `ps`
# Use: `focus <executable name>`
# e.g. `focus spotify` or `focus gnome-terminal`

PID=$(ps -ea | grep $1 | head -1 | awk '{print $1}')
WID="$(wmctrl -lp | grep $PID | awk '{print $1}')"
wmctrl -ia $WID
