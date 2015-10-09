#!/bin/bash
set -eou pipefail

exifautotran *.JPG
rm -f *.THM

for i in *.AVI
do
 mp4name=$(echo "$i"|cut -d"." -f1).mp4
 echo "Converting $i into $mp4name"
 avconv -i "$i" -c:v libx264 -c:a mp3 -ar 44100 "$mp4name"
 touch -a -m -r "$i" "$mp4name"
done
