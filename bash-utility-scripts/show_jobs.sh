#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
	echo "No arguments provided. To use this function, type 'bash count_files 'enter_string here'' (i.e. 'diga9728grp'). This will show all jobs for users in this group."
	exit 1
fi

group_string=$1

function show_group_jobs() {

	regex=".+\:.+\:.+\:(.*)"
	group_output="$(getent group $1)"

	if [[ $group_output =~ $regex ]]; then
		group_output_trimmed="${BASH_REMATCH[1]}"
	fi

	IFS=',' read -r -a group_member_list <<< "$group_output_trimmed"

	for member in "${group_member_list[@]}"
	do
		echo "$member"
		squeue -u "$member"
	done
}

show_group_jobs "$group_string"
