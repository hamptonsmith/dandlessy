#!/bin/bash

echo 'Starting app-run-loop.' >> "$DAND_LOG"

window-watcher > $HOME/windowlog &

if [[ -f "$XPROFILE_ERR" ]]; then
    zenity --error --message \
            "/etc/xprofile error:\n\n$(cat $XPROFILE_ERR)\n\nSee $DAND_LOG."
fi

/usr/bin/dunst &

if [[ -f /mnt/fossil/configureConnection ]]; then
    /bin/bash /mnt/fossil/configureConnection &
fi

if [[ "$PULSE_AUDIO_DEFAULT_SINK" != "" ]]; then
    pacmd "set-default-source $PULSE_AUDIO_DEFAULT_SINK"
fi

echo 'entering main loop' >> "$DAND_LOG"
while [ 1 ]; do
    echo 'open app menu' >> "$DAND_LOG"

    if [[ -d /mnt/fossil/wallpapers ]]; then
        feh --bg-fill --randomize --recursive /mnt/fossil/wallpapers/* &
        FEH_PID="$!"
    fi

    APP_TO_RUN=$(dand-menu 2>> "$DAND_LOG")

    if [[ "$FEH_PID" !== "" ]]; then
        kill $FEH_PID
        FEH_PID=""
    fi

    if [[ "$?" == "0" && "$APP_TO_RUN" != "" ]]; then
        echo "app $APP_TO_RUN selected"  >> "$DAND_LOG"
        run-app "$APP_TO_RUN" >> "$DAND_LOG"
        echo 'control returned to app-run-loop' >> "$DAND_LOG"
    else
        echo 'menu aborted or error' >> "$DAND_LOG"
    fi
done

echo 'Fell out of app-run-loop?' >> "$DAND_LOG"
