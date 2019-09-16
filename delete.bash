#!/bin/bash
read -p "Enter a course department code and number: " rDepCode rCourseNum

declare -u fDepCode=$rDepCode
filename=$fDepCode$rCourseNum.crs

count=0

if [ ! -f data/$filename ]
then
	echo ERROR: course not found
	exit 1
fi

while read a; do
	if [ $count == 1 ]
	then
	        rm data/$filename
		echo $(date) DELETED: $rDepCode $rCourseNum $a >> data/queries.log
              	echo course number was successfully deleted
		exit 0

	fi
	let count+=1
done < data/$filename



