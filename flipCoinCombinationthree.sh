#!/bin/bash

check=1
double=2
heads=0
tails=0

read -p "Enter the Number that you want to flip the coin number of times:" range
declare -A singlet
declare -A doublet

function random()
{
	randomCheck=$((RANDOM%2))
	echo $randomCheck
}
for (( i=1; i<=range; i++))
do
	for (( j=1; j<=double; j++ ))
	do
		result="$(random)"
		if (( $result == $check  ))
		then
			echo "HEAD"
			singlet[$i]=H
			coin+=H
			((heads++))
		else
			echo "TAIL"
			singlet[$i]=T
			((tails++))
			coin+=T
		fi
	done
	((doublet[$coin]++))
	coin=""
done
echo "Heads Count Is: $heads"
echo "Tails Count Is: $tails"
echo ${singlet[@]}
echo ${!doublet[@]}
echo ${doublet[@]}

headPercent=$((($heads/$range)*100))
echo "pecentage of heads is: $headPercent""%"
tailPercent=$((($tails/$range)*100))
echo "pecentage of tails is: $tailPercent""%"

function Percentage()
{
	ranges=$1
	for keyCount in ${!doublet[@]}
	do
		doublet[$keyCount]=$(((${doublet[$keyCount]})/$ranges*100))
		echo "Percentage of $keyCount Is: ${doublet[$keyCount]}""%"
	done
}

output=$(Percentage $range)
echo $output
