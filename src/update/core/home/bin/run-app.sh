#!/bin/bash

echo "run-app: $@"

if ! eval "$@"; then
    $BIN_NAME=$(basename $(cut -d' ' -f 1))
    zenity --error --message "$BIN_NAME exited with an error.  See $DAND_LOG."
fi

echo "run-app done: $@"

