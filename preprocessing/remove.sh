#!/bin/bash

# Delete directories
name="train"
for dir in *;
do
	rm -r "${dir}"/"${name}";
done

