#!/usr/bin/env bash

echo
find ./ -name "* *" -type d
echo
find ./ -name "* *" -type f
echo

read -p "Replace spaces with underscores? (y/n)" -n 1 answer
if [[ "$answer" == "y" ]]; then
	find ./ -maxdepth 1 -name "* *" -type d | rename 's/ /_/g'
	find ./ -maxdepth 2 -name "* *" -type d | rename 's/ /_/g'
	find ./ -maxdepth 3 -name "* *" -type d | rename 's/ /_/g'
	find ./ -name "* *" -type f | rename 's/ /_/g'
	find ./ -maxdepth 1 -name "*_-_*" -type d | rename 's/_-_/_/g'
	find ./ -maxdepth 2 -name "*_-_*" -type d | rename 's/_-_/_/g'
	find ./ -maxdepth 3 -name "*_-_*" -type d | rename 's/_-_/_/g'
	find ./ -name "*_-_*" -type f | rename 's/_-_/_/g'
	find ./ -maxdepth 1 -name "*__*" -type d | rename 's/__/_/g'
	find ./ -maxdepth 2 -name "*__*" -type d | rename 's/__/_/g'
	find ./ -maxdepth 3 -name "*__*" -type d | rename 's/__/_/g'
	find ./ -name "*__*" -type f | rename 's/__/_/g'
	echo
	echo
	echo "spaces removed"
else
	echo
	echo 
  	echo "moving on..."
	echo
fi

echo
find ./ -name "*.*" -type d
echo
find ./ -name "*.*.*" -type f
echo

read -p "Replace dot seperators with underscores? (y/n)" -n 1 answer
if [[ "$answer" == "y" ]]; then
	find ./ -maxdepth 1 -name "*.*" -type d | rename 's/\.(?!\/)/_/g' 
	find ./ -maxdepth 2 -name "*.*" -type d | rename 's/\.(?!\/)/_/g'
	find ./ -maxdepth 3 -name "*.*" -type d | rename 's/\.(?!\/)/_/g' 
	find ./ -name "*.*" -type f | rename 's/\.(?![^.]*$)(?!\/)(?!\s)/_/g'
        echo
        echo
        echo "dot seperators removed"
else
        echo
        echo 
        echo "moving on..."
        echo
fi

echo
find ./ -type d -name '*[*'
find ./ -type d -name '*]*'
echo
find ./ -type f -name '*[*'
find ./ -type f -name '*]*'
echo

read -p "Replace '[' and ']' with '(' and ')'? (y/n)" -n 1 answer
if [[ "$answer" == "y" ]]; then
	find ./ -maxdepth 1 -type d -name '*[*' | rename 's/\[/\(/g'
	find ./ -maxdepth 1 -type d -name '*]*' | rename 's/\]/\)/g' 
        find ./ -maxdepth 2 -type d -name '*[*' | rename 's/\[/\(/g' 
	find ./ -maxdepth 2 -type d -name '*]*' | rename 's/\]/\)/g'
        find ./ -maxdepth 3 -type d -name '*[*' | rename 's/\[/\(/g' 
	find ./ -maxdepth 3 -type d -name '*]*' | rename 's/\]/\)/g' 
	find ./ -type f -name '*[*' | rename 's/\[/\(/g'
	find ./ -type f -name '*]*' | rename 's/\]/\)/g'
        echo
	echo
        echo "brackets removed removed"
else
	echo
        echo
        echo "moving on..."
        echo
fi

echo
find ./ -type f -name '*download*\.[a-z]*'
find ./ -type f -name '*www*\.[a-z]*'
echo

read -p "Remove non-critical torrent source files? (y/n)" -n 1 answer
if [[ "$answer" == "y" ]]; then
	find ./ -type f -name '*download*\.[a-z]*' -delete
	find ./ -type f -name '*www*\.[a-z]*' -delete
        echo
        echo
        echo "None-critical files removed"
else
	echo
        echo
        echo "moving on..."
        echo
fi

echo
find ./ -type d -name '*www*[\-\_]*'
find ./ -type f -name '*www*[\-\_]*'
echo

read -p "Remove torrent source URLs? (y/n)" -n 1 answer
if [[ "$answer" == "y" ]]; then
	find ./ -maxdepth 1 -type d -name '*www*[\-\_]*' | rename 's/www.{1,20}(?:com|jpg|txt|net|org|html|de)\_?//g' 
        find ./ -maxdepth 2 -type d -name '*www*[\-\_]*' | rename 's/www.{1,20}(?:com|jpg|txt|net|org|html|de)\_?//g' 
        find ./ -maxdepth 3 -type d -name '*www*[\-\_]*' | rename 's/www.{1,20}(?:com|jpg|txt|net|org|html|de)\_?//g' 
        find ./ -type f -name '*www*[\-\_]*' | rename 's/www.{1,20}(?:com|jpg|txt|net|org|html|de)\_?//g'
        echo
        echo
        echo "URLs removed"
else
  	echo
        echo
        echo "moving on..."
        echo
fi

echo
find ./ -type f -name '*.meta'
echo

read -p "Purge .meta files? (y/n)" -n 1 answer
if [[ "$answer" == "y" ]]; then
	find ./ -type f -name '*.meta' -delete
else
        echo
        echo
fi
echo
