#!/bin/bash
if [ -x "$(which btop)" ]; then
    btop
elif [ -x "$(which htop)" ]; then
    htop
else
    top
fi
