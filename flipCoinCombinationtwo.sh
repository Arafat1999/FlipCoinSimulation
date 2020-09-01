#!/bin/bash

check=1

heads=0
tails=0

read -p "Enter the Number that you want to flip the coin number of times:" range
declare -A singlet

function random()
{
	randomCheck=$((RANDOM%2))
	echo $randomCheck
}
for (( count=0; count<range; count++))
do
	result="$(random)"
	if (( $result == $check  ))
	then
 		echo "HEAD"
		singlet[$count]=H
		((heads++))
	else
		echo "TAIL"
		singlet[$count]=T
		((tails++))
	fi
done
echo "Heads Count Is: $heads"
echo "Tails Count Is: $tails"
echo ${singlet[@]}

#calculating the percentage of heads and tails
headPercent=$((($heads/$range)*100))
	echo "Pecentage of Heads Is: $headPercent""%"
tailPercent=$((($tails/$range)*100))
	echo "Pecentage of Tails Is: $tailPercent""%"
