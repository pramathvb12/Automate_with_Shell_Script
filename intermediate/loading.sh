#!/usr/bin/env bash

arr=('-' '\' '|' '/')
while true; do
	for c in "${arr[@]}"; do
		echo -en "\r $c "
		sleep .9
		echo "Loading......!!"
	done
done
