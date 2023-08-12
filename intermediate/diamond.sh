#!/bin/bash

MAX_NO=0

echo -n "Enter Number between (1 to 9) : "
read MAX_NO

if ! [ $MAX_NO -ge 1 -a $MAX_NO -le 9 ]; then
	echo "enter number between 5 and 9, Try Again"
	exit 1
fi

clear
#################First Stage##############
echo "***********************"
for ((i = 1; i <= MAX_NO; i++)); do
	for ((s = MAX_NO; s >= i; s--)); do
		echo -n " "
	done
	for ((j = 1; j <= i; j++)); do
		echo -n " ."
	done
	echo " "
done
###### Second stage ######################
for ((i = MAX_NO; i >= 1; i--)); do
	for ((s = i; s <= MAX_NO; s++)); do
		echo -n " "
	done
	for ((j = 1; j <= i; j++)); do
		echo -n " ."
	done
	echo " "
done
echo "***********************"

echo "Thanks for using"
