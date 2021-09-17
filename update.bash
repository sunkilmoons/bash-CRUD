#!/bin/bash

read -p "Item number: " item_number
read -p "Simple name: " simple_name
read -p "Item name: " item_name
read -p "Current quantity: " current_quantity
read -p "Maximum quantity: " maximum_quantity
read -p "Description: " description

function getCurrentVars() {
	{
		read simple_name2 item_name2
		read current_quantity2 maximum_quantity2
		read description2
	} < ./data/$item_number.item
}

function update() {
	getCurrentVars

	if [[ -z $simple_name ]]; then
		simple_name="$simple_name2"
	fi
	if [[ -z $item_name ]]; then
		item_name="$item_name2"
	fi	
	if [[ -z $current_quantity ]]; then
		current_quantity="$current_quantity2"
	fi
	if [[ -z $maximum_quantity ]]; then
		maximum_quantity="$maximum_quantity2"
	fi
	if [[ -z $description ]]; then
		description="$description2"
	fi

	rm ./data/$item_number.item	

	echo -e "$simple_name $item_name \
		\n$current_quantity $maximum_quantity \
		\n$description" >> ./data/$item_number.item	

	echo -e "UPDATED: `date "+%Y-%m-%d %H:%M:%S"` - $simple_name" >> ./data/queries.log
}

if [[ -f "./data/$item_number.item" ]]; then
	update	
else
	echo "ERROR: item not found"
fi	
