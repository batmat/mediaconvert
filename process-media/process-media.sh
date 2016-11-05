#!/bin/bash
set -ou pipefail

if ls *.JPG > /dev/null 2>&1 ; then
  echo "Reset image orientation."
  set -e
  exifautotran *.JPG
  set +e
else
  echo "No image found."
fi
rm -f *.THM

if ls *.AVI > /dev/null 2>&1 ; then
  for i in *.AVI
  do
   set -e
   mp4name=$(echo "$i"|sed 's/.AVI$//').mp4
   echo "Converting $i into $mp4name"
   avconv -i "$i" -c:v libx264 -c:a mp3 -ar 44100 "$mp4name"
   touch -a -m -r "$i" "$mp4name"
   set +e
  done

else
  echo "No .AVI found."
fi

if ls *.MP4  > /dev/null 2>&1 ; then
  for i in *.MP4
  do
   set -e
   mp4name=$(echo "$i"|sed 's/.MP4$//').mp4
   echo "Converting $i into $mp4name"
   avconv -i "$i" -c:v libx264 -c:a copy "$mp4name"
   touch -a -m -r "$i" "$mp4name"
  done
else
  echo "No .MP4 found."
fi
