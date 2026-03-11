#!/usr/bin/env bash

systemctl --user enable --now hyprpolkitagent.service
systemctl enable bluetooth.service
