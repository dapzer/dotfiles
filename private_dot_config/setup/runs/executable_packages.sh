#!/usr/bin/env bash

BLUE='\033[1;34m'
NC='\033[0m'

packages=(
  "micro"
  "archlinux-keyring"
  "hyprpolkitagent"
  "xorg-xhost"
  "wl-clipboard"
  "downgrade"
  "reflector"
  "btop"
  "tilix"
  "ghostty"
  "fastfetch"
  "nemo"
  "ark"
  "pavucontrol"
  "traceroute"
  "font-manager"
  "ttf-jetbrains-mono-nerd"
  "ttf-ms-fonts"
  "ttf-iosevka-nerd"
  "awww-bin"
  "vicinae"
  "hyprland"
  "hyprpicker"
  "hyprshot"
  "grimblast-git"
  "satty"
  "waybar"
  "swaync"
  "wlogout"
)

for item in "${packages[@]}"; do
  echo -e "${BLUE}Starting installation of $item ${NC}"
  yay -S --noconfirm --needed $item
  echo -e "${BLUE}Finished installing: $item ${NC}"
done
