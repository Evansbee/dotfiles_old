#!/bin/sh
xrdb .Xresources &
#cairo-compmgr &
sleep 1s && xsetroot -cursor_name left_ptr &
xscreensaver -no-splash &
sh ~/.fehbg
tint2 &
dropboxd &
systemd --user &
xflux -z 07030 &
exec openbox-session
