#!/bin/bash
set -eou pipefail

original=$1
cible=$(echo $1|cut -d'.' -f1)-rotated.mp4

if [ "a$2" = "al" ] ;then
	rotate=2
elif [ "a$2" = "ar" ]; then
	rotate=1
else
	echo "Missing param: r or l"
	exit 1
fi

avconv -i "$original" -c:a copy -c:v libx264 -vf transpose=$rotate "$cible"
touch -a -m -r "$original" "$cible"

mv "$original" "$original".original.mp4
mv "$cible" "$original"
