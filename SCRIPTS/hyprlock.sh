#!/bin/bash

if hyprctl monitors | grep -q "Monitor eDP-1"; then
    grim -t jpeg -q 100 -o eDP-1 $HOME/.cache/bg.jpeg
fi

hyprctl keyword input:kb_layout us
hyprlock --quiet --immediate --no-fade-in

hyprctl keyword input:kb_layout us,ru
rm $HOME/.cache/bg*.jpeg
