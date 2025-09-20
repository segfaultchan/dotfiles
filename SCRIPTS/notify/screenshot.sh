#!/usr/bin/env bash

set -euo pipefail

case "${1:-}" in
	cut)	grim -g "$(slurp)" - | wl-copy --type image/png ;;
	screen)	grim - | wl-copy --type image/png ;;
	*)		echo "screen or cut arg"; exit 2;;
esac

notify-send "Screenshot" "Saved screenshot to clipboard"
