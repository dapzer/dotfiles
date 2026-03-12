#!/usr/bin/env bash

BLUE='\033[1;34m'
NC='\033[0m'

packages=(
  "zen-browser-bin"
  "tor-browser-bin"
  "google-chrome"
  "firefox"
  "telegram-desktop-bin"
  "spotify"
  "scrcpy"
  "qbittorrent"
  "qalculate-qt"
  "obs-studio-browser"
  "obsidian-bin"
  "vlc"
  "mpv"
  "bitwarden-bin"
)

for item in "${packages[@]}"; do
  echo -e "${BLUE}Starting installation of $item ${NC}"
  yay -S --noconfirm --needed $item
  echo -e "${BLUE}Finished installing: $item ${NC}"
done
