#!/bin/sh
xrdb .Xresources &

sleep 1s && xsetroot -cursor_name left_ptr &
xscreensaver -no-splash &
exec awesome
