xrdb -load ~/.Xresources

xset s off
xset -dpms
xset s noblank

xset r rate 200 20

setxkbmap us
setxkbmap -option ctrl:nocaps

### Select a window manager

### i3 execs
# exec dbus-launch dwm
# exec --no-startup-id xss-lock -- ~/.config/i3/lock.sh

### xmonad
exec xmonad

# vim: set ft=sh :
