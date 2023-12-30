#!/bin/bash

# Renaming folders
# https://askubuntu.com/questions/882263/rename-multiple-directories-in-the-command-line

name=(AE1 AE2 AA1 AA2 AA3 AA4 AA5 AA6 AC11 S11 S12 S13 BC11 BC12 BC13 BC14 BC15 BC16 BC21 BC22 BC23 BC24 BC31 BC32)
count=0

for dir in $(ls | sort -n);
do
	mv "${dir}" "${name[count]}";

	((count++))
done
