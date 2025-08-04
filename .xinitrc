setxkbmap -layout "us, ru" -option "grp:alt_shift_toggle"

picom --config ~/.config/picom/picom.conf &

feh --bg-scale ~/Downloads/fuji.jpg &

exec dwm
