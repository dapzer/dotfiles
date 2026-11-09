#!/usr/bin/env bash
set -euo pipefail

state_file="${XDG_STATE_HOME:-$HOME/.local/state}/obs-privacy"

case "${1:-status}" in
  status)
    if [[ -f "$state_file" ]] && [[ "$(<"$state_file")" == "private" ]]; then
      printf '%s\n' '{"text":"Private","class":"private","tooltip":"Desktop and WebCam KB are hidden"}'
    else
      printf '%s\n' '{}'
    fi
    ;;
  show)
    obs-cmd scene-item enable Dev 'WebCam KB'
    obs-cmd scene-item enable Dev Desktop
    mkdir -p "$(dirname "$state_file")"
    printf 'visible\n' > "$state_file"
    pkill -RTMIN+10 -x waybar || true
    ;;
  hide)
    obs-cmd scene-item disable Dev 'WebCam KB'
    obs-cmd scene-item disable Dev Desktop
    mkdir -p "$(dirname "$state_file")"
    printf 'private\n' > "$state_file"
    pkill -RTMIN+10 -x waybar || true
    ;;
  *)
    printf 'Usage: %s {show|hide|status}\n' "$0" >&2
    exit 2
    ;;
esac
