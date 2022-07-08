#!/bin/bash

# see man zscroll for documentation of the following parameters
zscroll -l 17 \
        --delay 0.52 \
        --scroll-padding " / " \
        --match-command "`dirname $0`/get_music.sh --status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "`dirname $0`/get_music.sh" &

wait
