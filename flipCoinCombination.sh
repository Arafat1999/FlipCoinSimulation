#!/bin/bash -x

value=1
randomCheck=$((RANDOM%2))

if (( randomCheck == value ))
then
	echo HEAD
else
	echo TAIL
fi
