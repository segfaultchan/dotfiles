#!/usr/bin/env bash
set -euo pipefail

case $1 in
  up)   brightnessctl set +10%  ;;
  down) brightnessctl set 10%-  ;;
  *)    echo "Usage: $0 up|down"; exit 2 ;;
esac

PCT=$(( $(brightnessctl g) * 100 / $(brightnessctl m) ))
notify-send "Brightness" "${PCT}%"
