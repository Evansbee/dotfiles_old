#!/bin/sh
xrdb .Xresources &
#VBoxClient-all &
#cairo-compmgr &
sleep 1s && xsetroot -cursor_name left_ptr &
xscreensaver -no-splash &
sh ~/.fehbg
tint2 &
dropboxd &
exec openbox-session
