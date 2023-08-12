#!/bin/bash

for x in $(cat city.txt);
do
	weather=$(curl -s http://wttr.in/$x?format=3)
	echo "the weather for $weather"

done
