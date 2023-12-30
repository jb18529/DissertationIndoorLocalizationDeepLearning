#!/bin/bash

#find . -maxdepth 1 -type f | sort | head "-$dir_size" | xargs -i mv "{}" "$i";


# $( ls -d * | sort -n )
#for dir in $(ls | sort -n);
dir_size=12;
cd ~/Downloads/IndoorDataset1
n=$((`find . -maxdepth 1 -type f | wc -l`/$dir_size));

echo "$n";

#mkdir -p ~/Downloads/Tester
#for i in *.jpg
#do	       
#       	mv "$i" ~/Downloads/Tester;
#done

