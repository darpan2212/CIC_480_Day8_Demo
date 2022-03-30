#!/bin/bash

declare -A dailyWage;

PRESENT=1;
PART_TIME=2;
WAGE_PER_HOUR=20;
MAX_WORKING_DAY=20;
MAX_WORKING_HOUR=40;

function getWorkingHour() {
	case $1 in

		$PRESENT)
			wHour=8;
		;;

		$PART_TIME)
			wHour=4;
		;;

		*)
			wHour=0;
		;;
	esac;

	echo $wHour;
}

totalWorkingHour=0;

day=0;
while [[ $day -lt $MAX_WORKING_DAY && $totalWorkingHour -lt $MAX_WORKING_HOUR ]]
do
	if [ $((totalWorkingHour + 4)) -ge $MAX_WORKING_HOUR ]
	then
		isPresent=$PART_TIME;
	else
		isPresent=$((RANDOM%3));
	fi

	workingHour=$(getWorkingHour $isPresent);
	dailyWage["Day$day"]=$((workingHour*WAGE_PER_HOUR));
	totalWorkingHour=$((totalWorkingHour+workingHour));
	((day++));
done

totalSalary=$((totalWorkingHour*WAGE_PER_HOUR));

echo "Employee monthly wage : $"$totalSalary "USD";
echo "Total working hour : $totalWorkingHour Hr";
echo "Total working day : $day";

echo ${dailyWage[@]};

for key in ${!dailyWage[@]}
do
	echo "$key : $"${dailyWage[$key]} "USD";
done
