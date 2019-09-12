#!/usr/bin/bash

read -p "Enter a department code and course number: " rDepCode rCourseNum

filename=$rDepCode$rCourseNum.crs

if [ ! -f data/$filename ]
then 
	echo ERROR: course not found
else
	count=0
	while read a b; do
		if [ $count == 0 ]
		then
			echo Course department: $a $b
		elif [ $count == 1 ]
		then 
			echo Course number: $rCourseNum
		elif [ $count == 2 ]
		then
			echo Scheduled days: $a
			echo Course start: $b
			echo Course end: $c
		elif [ $count == 3 ]
		then
			echo Credit hours: $a
		else
			echo Enrolled Students: $a
		fi
		let count+=1
	done < data/$filename
fi


