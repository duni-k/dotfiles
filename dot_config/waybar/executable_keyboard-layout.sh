#!/bin/bash
idx=$(niri msg keyboard-layouts 2>/dev/null | awk '/^\s*\*/ {print $2}')
layouts=$(grep -oP 'layout\s+"\K[^"]+' ~/.config/niri/config.kdl 2>/dev/null | head -1)
IFS=',' read -ra arr <<< "$layouts"
layout="${arr[$idx]:-?}"
echo "${layout^^}"
