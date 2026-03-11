#!/usr/bin/env bash

BLUE='\033[1;34m'
NC='\033[0m'

packages=(
  "lazydocker"
  "nodejs"
  "webstorm"
  "webstorm-jre"
  "pycharm"
  "go"
  "goland"
  "goland-jre"
  "visual-studio-code-bin"
  "ngrok"
  "opencode-bin"
)

for item in "${packages[@]}"; do
  echo -e "${BLUE}Starting installation of $item ${NC}"
  yay -S --noconfirm --needed $item
  echo -e "${BLUE}Finished installing: $item ${NC}"
done
