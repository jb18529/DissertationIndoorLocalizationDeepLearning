#!/bin/bash

dir_original="Dataset";

# Convert HEIC to JPG
cd ~/Downloads/"$dir_original";
for f in *.HEIC;
do
        heif-convert -q 100 $f $f.jpg;
done
echo "HEIC to JPG";

# Rotate JPG images to upright
for szFile in ~/Downloads/"$dir_original"/*.jpg;
do
       convert "$szFile" -rotate 270 ~/Downloads/DatasetJPG/"$(basename "$szFile")";
done

