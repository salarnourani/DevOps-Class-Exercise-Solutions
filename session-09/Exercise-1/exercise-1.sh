#!/bin/bash

# Exercise1: Compare input number with 10

read -p "Please Type Nember :" var

if [ "$var" -gt 10 ]; then
    echo "Larger than 10."

elif [ "$var" -eq 10 ]; then
    echo "Equal to 10."

else
    echo "Smaler than 10."
fi
