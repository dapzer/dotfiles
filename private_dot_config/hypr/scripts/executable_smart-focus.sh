#!/usr/bin/env bash
# Usage: smart-focus.sh left|right

direction="$1"

active=$(hyprctl activewindow -j)
grouped=$(jq -r '.grouped' <<< "$active")
group_size=$(jq 'length' <<< "$grouped")

if [[ $group_size -eq 0 ]]; then
    # Not in group → normal movefocus
    hyprctl dispatch "hl.dsp.focus({ direction = \"$direction\" })"
    exit 0
fi

# In group → find current position (0-based index)
addr=$(jq -r '.address' <<< "$active")
pos=$(jq --arg addr "$addr" 'map(tostring) | index($addr)' <<< "$grouped")

if [[ $direction == "l" || $direction == "left" ]]; then
    if [[ $pos -eq 0 ]]; then
        # At left edge → exit group left
        hyprctl dispatch 'hl.dsp.focus({ direction = "l" })'
    else
        # Inside group → previous tab
        hyprctl dispatch 'hl.dsp.group.prev()'
    fi
elif [[ $direction == "r" || $direction == "right" ]]; then
    last=$((group_size - 1))
    if [[ $pos -eq $last ]]; then
        # At right edge → exit group right
        hyprctl dispatch 'hl.dsp.focus({ direction = "r" })'
    else
        # Inside group → next tab
        hyprctl dispatch 'hl.dsp.group.next()'
    fi
fi
