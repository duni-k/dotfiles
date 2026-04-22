#!/bin/bash
STATE_FILE="/tmp/waybar-idle-inhibitor"

toggle() {
    SWAYIDLE_PID=$(pgrep swayidle)
    if [ -f "$STATE_FILE" ]; then
        [ -n "$SWAYIDLE_PID" ] && kill -CONT "$SWAYIDLE_PID"
        rm -f "$STATE_FILE"
    else
        [ -n "$SWAYIDLE_PID" ] && kill -STOP "$SWAYIDLE_PID"
        touch "$STATE_FILE"
    fi
    pkill -RTMIN+9 waybar
}

status() {
    if [ -f "$STATE_FILE" ]; then
        echo '{"text": "󰈈", "class": "activated", "tooltip": "Idle inhibited"}'
    else
        echo '{"text": "󰈉", "class": "deactivated", "tooltip": "Idle active"}'
    fi
}

case "$1" in
    toggle) toggle ;;
    *) status ;;
esac
