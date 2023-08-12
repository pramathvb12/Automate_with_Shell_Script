#!/bin/bash

echo "Enter the name"
sleep 3
read name
echo "Enter the age"
sleep 3
read age
if [[ $age >='18' ]];
then
	echo "Your eligile for voting..."
else
	echo "not eligible!!! "
fi
q=$(($RANDOM %14 + age))

echo "You are $name and age is $age"
sleep 3
echo "....."
sleep 3
echo "...."
sleep 3
echo "..."
sleep 3
echo ".."
sleep 3
echo "."
sleep 5
echo "You will millionaire in this $q"

