#!/bin/bash

echo 'Starting app-run-loop.' >> "$DAND_LOG"

if [[ -f "$XPROFILE_ERR" ]]; then
    zenity --error --message \
            "/etc/xprofile error:\n\n$(cat $XPROFILE_ERR)\n\nSee $DAND_LOG."
fi

echo 'entering main loop' >> "$DAND_LOG"
while [ 1 ]; do
    echo 'open app menu' >> "$DAND_LOG"
    
    # rofi runs its command in the background, so we just echo what it wants
    # to run so we can run it in-line.
    COMMAND_TO_RUN=$(rofi -show drun -run-command "echo {cmd}")
    "$HOME/bin/run-app.sh" "$COMMAND_TO_RUN" >> "$DAND_LOG"
    
    echo 'control returned to app-run-loop' >> "$DAND_LOG"
done

echo 'Fell out of app-run-loop?' >> "$DAND_LOG"
