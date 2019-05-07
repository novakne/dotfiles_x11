nitrogen --restore &
compton &
[ ! -s ~/.config/mpd/pid ] && mpd &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &
exec bspwm
