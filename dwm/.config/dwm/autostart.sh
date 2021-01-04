#!/bin/sh

# Wallpaper
nitrogen --restore &

# lxsession
lxsession &

# Java bugs
wmname LG3D &

# Picom
picom --config $HOME/.config/dwm/picom/picom.conf &
