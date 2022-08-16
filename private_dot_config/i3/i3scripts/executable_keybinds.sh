INDEX=$(cat ~/.config/i3/config | grep '^bindsym' | grep -v '^\s*#' | sed 's/bindsym //' | sed 's/--no-startup-id //' | sed 's/exec //' | sed 's/\$mod/Mod/' | sed 's/Control/Ctrl/'| sed 's/^\([^ ]*\) \(.*\)$/\1: \2/' | rofi -dmenu -p 'Keybinds' -format i )
# parse out none list input
if [[ ! -z "$INDEX" ]] && [[ $INDEX -ge 0 ]]; then
    # rofi starts at 0 but sed does not
    I=$(echo $INDEX+1 | bc)
    # match index with actual none cleaned list and then clean it a bit for i3
    RUN=$(cat ~/.config/i3/config | grep '^bindsym' | grep -v '^\s*#' | sed 's/bindsym / /' | sed "${I}q;d" | sed 's/^\s*//' | cut -d' ' -f 2- | sed 's/;/ \&\& i3/g')
    i3 "$RUN"
fi
