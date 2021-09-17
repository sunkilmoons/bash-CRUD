#!/bin/bash

read -p "Enter an item number: " item_number

if [[ -f "./data/$item_number.item" ]]; then
	read < "./data/$item_number.item" simple_name extra
	rm "./data/$item_number.item"
	echo -e "DELETED: `date "+%Y-%m-%d %H:%M:%S"` - $simple_name" >> ./data/queries.log
	echo "$simple_name was successfully deleted."
else
	echo "ERROR: item not found"
fi
