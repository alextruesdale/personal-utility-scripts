#!/usr/bin/env bash

find . -type f -name '._*'

read -p "Delete these files? (y/n)" -n 1 answer
if [ "$answer" == "y" ]; then
	find . -type f -name '._*' -delete
	echo
	echo "files deleted"
else
	echo
	echo 
  	echo "moving on..."
	echo
fi

find . -type f -name '.DS_*'

read -p "Delete these files? (y/n)" -n 1 answer
if [ "$answer" == "y" ]; then
        find . -type f -name '.DS_*' -delete
	echo
	echo "files deleted"
else
        echo
	echo
fi
