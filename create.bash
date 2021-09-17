#!/bin/bash

read -p "Item number: " item_number
read -p "Simple name: " simple_name
read -p "Item name: " item_name
read -p "Current quantity: " current_quantity
read -p "Maximum quantity: " max_quantity
read -p "Description: " description

if [[ -f "./data/$item_number.item" ]]; then
	echo "ERROR: item already exists"
	rm ./data/$item_number.item
fi

echo -e "$simple_name $item_name \
	\n$current_quantity $max_quantity \
	\n$description" >> ./data/$item_number.item

echo "CREATED: `date "+%Y-%m-%d %H:%M:%S"` - $simple_name" >> ./data/queries.log
