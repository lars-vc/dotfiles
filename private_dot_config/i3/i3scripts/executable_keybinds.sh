RUN=$(cat ~/.config/i3/config | grep 'bindsym' | grep -v '^\s*#' | sed 's/bindsym / /' | rofi -dmenu -p 'Keybinds' | sed 's/^\s*//' | cut -d' ' -f 2- | sed 's/;/ \&\& i3/g' )
if [[ ! -z "$RUN" ]]; then
    i3 $RUN
fi
