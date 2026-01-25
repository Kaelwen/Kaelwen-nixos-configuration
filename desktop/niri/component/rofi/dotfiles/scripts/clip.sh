list="`cliphist list`" 

rofi_cmd() {
	rofi -dmenu \
		-theme "~/.config/rofi/themes/clip.rasi"
}

run_rofi() {
    chosen=$(printf '%s\n' "$list" | rofi_cmd)
    if [ -z "$chosen" ]; then
        return 1
    fi
    set -- $chosen
    echo "$1"
}

chosen=$(run_rofi) || exit 0
wl-copy $(cliphist decode $chosen)

