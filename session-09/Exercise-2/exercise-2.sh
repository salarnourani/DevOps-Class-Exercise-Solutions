#!/bin/bash

# Exercise 2: Find min and max of 20 numbers


read -p "Type Number 1: " num

max=$num
min=$num

for i in {2..20}
do
    read -p "Enter number $i: " num
    
    if [ "$num" -gt "$max" ]; then
        max=$num
    fi

    if [ "$num" -lt "$min" ]; then
        min=$num
    fi
done

echo "Largest number is: $max"
echo "Smallest number is: $min"
