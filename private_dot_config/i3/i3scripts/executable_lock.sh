#!/bin/bash

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#09b0e8'
TEXT='#09b0e8'
VERIFYING='#09b0e8'
WRONG='#880000bb'
# DEFAULT='#8957E5'
# TEXT='#8957E5'
# VERIFYING='#8957E5'

# pause music
playerctl pause

~/.config/i3/i3scripts/i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--blur 7                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %d %b %y"    \
--noinput-text="No input"   \
--wrong-text="Wrong!"   \
--verif-text="Verifying..."   \
--ignore-empty-password \
