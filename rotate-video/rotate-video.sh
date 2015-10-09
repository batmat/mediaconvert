#!/bin/bash
set -eou pipefail

cible=$(echo $1|cut -d'.' -f1)-rotated.mp4

if [ "a$2" = "al" ] ;then
	rotate=2
elif [ "a$2" = "ar" ]; then
	rotate=1
else
	echo "Missing param: r or l"
	exit 1
fi

avconv -i "$1" -ar 44100 -c:a mp3 -c:v libx264 -vf transpose=$rotate "$cible"
touch -a -m -r "$1" "$cible"
