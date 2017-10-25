#!/bin/bash

while [ 1 ]
do
find /home/ds/Pictures/wallpapers/ -type f > ~/walls.txt
count=$(cat ~/walls.txt | wc -l)
    for files in $(seq $count)
    do
        file=$(cat ~/walls.txt  | head -n $files | tail -n 1)
        gconftool-2 --type string --set /desktop/gnome/background/picture_filename "$file"
        sleep 5 # wait 5 minutes before changing again
    done
done
