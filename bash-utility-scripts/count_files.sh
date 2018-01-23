#! usr/bin/bash

if  [ $# -eq 0 ]; then
    echo "No arguments provided. To use this function, type 'bash count_files 'enter_string here'' (i.e. '*194*'). This will show all file counts in directories from the years 1940-1949."
    exit 1
fi

directory_find_string=$1

function make_dir_list() {
	
	dir_list=()
	while IFS=  read -r -d $'\0'; 
	do
	    dir_list+=("$REPLY")
	done < <(find . -maxdepth 1 -type d -name "$1" -print0)

	IFS=$'\n' sorted_dir_list=($(sort <<<"${dir_list[*]}"))
	unset IFS

	for i in "${sorted_dir_list[@]}"
	do
		cd "${i:2}"
		echo "${i:2}"
		find . -type f | wc -l
		cd ..
	done
}

make_dir_list "$directory_find_string"

