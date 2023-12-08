#!/bin/bash

help() {
	for arg in "$@"; do
		if [[ $arg = "--help" ]]; then
			echo "You have to enter three argumenets"
			echo "The first one is the source image"
			echo "The second one is the overlay image"
			echo "The third argument is the path where we put the result image"
			exit 0
		fi
	done
}

revert() {
	rm /tmp/screen_blur.png
	xset dpms 0 0 0
}
help "$@"

trap revert HUP INT TERM
xset +dpms dpms 0 0 5
convert -blur 0x8 $1 /tmp/screen_blur.png
convert -composite /tmp/screen_blur.png $2 -gravity South -geometry -20x1200 $3
revert
