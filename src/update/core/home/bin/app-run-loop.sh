#!/bin/bash

echo 'Starting app-run-loop.' >> "$DAND_LOG"

if [[ -f "$XPROFILE_ERR" ]]; then
    zenity --error --message \
            "/etc/xprofile error:\n\n$(cat $XPROFILE_ERR)\n\nSee $DAND_LOG."
fi

echo 'entering main loop' >> "$DAND_LOG"
while [ 1 ]; do
    echo 'open app menu' >> "$DAND_LOG"
    
    APP_TO_RUN=$(dand-menu 2>> "$DAND_LOG")
    
    if [[ "$?" == "0" && "$APP_TO_RUN" != "" ]]; then
        echo "app $APP_TO_RUN selected"  >> "$DAND_LOG"
        run-app "$APP_TO_RUN" >> "$DAND_LOG"
        echo 'control returned to app-run-loop' >> "$DAND_LOG"
    else
        echo 'menu aborted or error' >> "$DAND_LOG"
    fi
done

echo 'Fell out of app-run-loop?' >> "$DAND_LOG"
