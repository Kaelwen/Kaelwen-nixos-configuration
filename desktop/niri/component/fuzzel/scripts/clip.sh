list="`cliphist list`" 

run_fuzzel() {
    chosen=$(printf '%s\n' "$list" | fuzzel -d)
    if [ -z "$chosen" ]; then
        return 1
    fi
    set -- $chosen
    echo "$1"
}

chosen=$(run_fuzzel) || exit 0
wl-copy $(cliphist decode $chosen)

