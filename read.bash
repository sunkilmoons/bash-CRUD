#!/bin/bash

read -p "Enter an item number: " item_number

function getInfo() {
	{
		read simple_name item_name
		read current_quantity max_quantity
		read description	
	} < ./data/$item_number.item
	
	echo "Item Name: $item_name"
	echo "Simple Name: $simple_name"
	echo "Item Number: $item_number"
	echo "Qty: $current_quantity/$max_quantity"
	echo "Description: $description"
}

if [[ -f "./data/$item_number.item" ]]; then
	getInfo
else
	echo "ERROR: item not found"
fi

