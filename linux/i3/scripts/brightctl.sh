#!/bin/bash

currentBrightness=$(brightnessctl get)

if [[ -z $1 ]]; then
	nextbright=$((currentBrightness + 10))
else
	nextbright=$((currentBrightness - 10))
fi

brightnessctl set $nextbright
