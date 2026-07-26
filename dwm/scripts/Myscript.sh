#!/bin/sh

feh --bg-scale /home/amans/Pictures/3BAAAAAAAAAAAa.jpg
setxkbmap -layout us,ru -option grp:win_space_toggle
#dwmblocks &

xinput set-prop "BLTP7853:00 347D:7853 Touchpad" "libinput Tapping Enabled" 1


export QT_QPA_PLATFORMTHEME=gtk3
export QT_STYLE_OVERRIDE=Adwaita-dark
export GTK_THEME=Adwaita:dark
export PATH="$HOME/dwm/scripts:$PATH"
dwmblocks &
picom -b &

# Qt окружение для KDE/Plasma приложений
export QT_QPA_PLATFORM=xcb
export QT_PLUGIN_PATH=/usr/lib/qt6/plugins
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt6/plugins/platforms
export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH

#while true; do
    # Log stderror to a file 
    dwm 2> ~/.dwm.log
    #startx ~/usr/bin/dwm -- :1 vt8 &
    # No error logging
    # dwm >/dev/null 2>&1
#done

