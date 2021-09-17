#!/bin/bash

if [ ! -d "./data" ]; then

	mkdir "data" 
fi

function initialPrompt() {
	echo "Enter one of the following actions or press CTRL-D to exit."
     	echo "C - create a new item"
     	echo "R - read an existing item"
     	echo "U - update an existing item"
     	echo "D - delete an existing item"
	echo ":"
}

prompt=$(initialPrompt)

while read -p "$prompt" command; do	

	case "$command" in

	[Cc])
		bash ./create.bash
		;;
	[Rr])
		bash ./read.bash
		;;
	[Uu])
		bash ./update.bash
		;;
	[Dd])
		bash ./delete.bash
		;;
	?)
		echo "ERROR: invalid option"
		;;
	esac

done

