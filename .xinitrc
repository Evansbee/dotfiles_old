#!/bin/sh
xrdb .Xresources &
VBoxClient-all &
#cairo-compmgr &
sleep 1s && xsetroot -cursor_name left_ptr &
xscreensaver -no-splash &
#exec awesome
sh ~/.fehbg
tint2 &
exec openbox-session
