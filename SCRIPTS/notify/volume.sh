#!/usr/bin/env bash

set -euo pipefail

case $1 in
	up)
		wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
		;;
	down)
		wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
		;;
	*)
		echo "up or down arg"; exit 2
		;;
esac

PCT=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

notify-send "Volume" "${PCT}"
