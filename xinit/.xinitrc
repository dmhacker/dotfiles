#!/bin/sh

xrdb -merge "$HOME/.Xresources"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

sxhkd &
redshift -l 32.8473:-117.2742 -t 6500:2700 &
exec bspwm
