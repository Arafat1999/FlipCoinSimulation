#!/bin/bash

declare -A dictionary
read -p "Enter the Number that you want to flip the coin number of times:" ranges
echo "****CHOICES****"
echo "1. Singlet."
echo "2. Dublet."
echo "3. Triplet."
read -p "Enter the choice:" choose

function random()
{
	randomCheck=$((RANDOM%2))
	echo $randomCheck
}

function Percentage()
{
	range=$1
	for keyCount in ${!dictionary[@]}
	do
		dictionary[$keyCount]=$(((${dictionary[$keyCount]})/$range*100))
		echo "Percentage of $keyCount Is: ${dictionary[$keyCount]}""%"
	done
}
function sorted()
{
	for k in ${!dictionary[@]}
	do
		echo $k '-' ${dictionary[$k]}
	done |
	sort -rn -k3
}

function triplet() {

	check=1
	heads=0
	tails=0
	range=$1
	choice=$2

	for (( i=1; i<=range; i++))
	do
		for (( j=1; j<=choice; j++ ))
		do
			result="$(random)"
			if (( $result == $check  ))
			then
				coin+=H
				((heads++))
			else
				((tails++))
				coin+=T
			fi
		done

		((dictionary[$coin]++))

		coin=""
	done
	echo "Heads count= $heads"
	echo "Tails count= $tails"
	echo ${!dictionary[@]}
	echo ${dictionary[@]}
	echo "$(Percentage $ranges)"
	echo "$(sorted)"
	echo "Winner Is: $(sorted | head -1)"
}

if (( $choose > 0 && $choose < 4 ))
then
	echo "$(triplet $ranges $choose)"
else
	echo Invalid Choice.
fi
