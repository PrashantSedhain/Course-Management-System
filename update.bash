#!/bin/bash

read dept_code
read dept_name
read course_number
read course_name
read course_schedule
read course_startDate
read course_endDate
read credit_hours
read initial_enrollment

declare -u depName=$dept_code
filename=$depName$course_number.crs

if [ ! -f data/$filename ]
then
       	echo ERROR: course not found
	exit 1
fi


function copyData() {
	count=1
	while read a b c; do
		if [ $count == "1" ]
		then
			echo pdept_code=$a > data/temp.crs
			echo pdept_name=\"$b $c\" >> data/temp.crs
		elif [ $count == "2" ]
		then
			echo pcourse_name=\"$a $b $c\" >> data/temp.crs
		elif [ $count == "3" ]
		then
			echo pcourse_schedule=$a >> data/temp.crs
			echo pcourse_startDate=$b >> data/temp.crs
			echo pcourse_endDate=$c >> data/temp.crs
		elif [ $count == "4" ]
		then
			echo pcredit_hours=$a >> data/temp.crs
		else
			echo pinitial_enrollment=$a >> data/temp.crs
		
		fi

		let count+=1

	done < data/$filename

}

        	copyData
        	source data/temp.crs
        	if [ "$dept_name" == "" ]
        	then
                	echo $dept_code $pdept_name > data/$filename
		else
			echo $dept_code $dept_name > data/$filename
		fi

		if [ "$course_name" == "" ] 
		then
			echo $pcourse_name >> data/$filename
		else
			echo $course_name >> data/$filename

		fi

		temporary=""

		if [ "$course_schedule" == "" ] 
		then
			temporary+=$pcourse_schedule
		else
			temporary+=$course_schedule
		fi

		if [ "$course_startDate" == "" ]
                then
                        temporary+=" $pcourse_startDate"
                else
                        temporary+=" $course_startDate"
                fi
		
		if [ "$course_endDate" == "" ]
                then
                        temporary+=" $pcourse_endDate"
                else
                        temporary+=" $course_endDate"
                fi

		echo $temporary >> data/$filename

		if [ "$credit_hours" == "" ]
		then
			echo $pcredit_hours >> data/$filename
		else
			echo $credit_hours >> data/$filename
		fi

		if [ "$initial_enrollment" == "" ] 
		then
			echo $pinitial_enrollment >> data/$filename
		else
			echo $initial_enrollment >> data/$filename
		fi


        echo $(date) UPDATED: $depName $course_number $pcourse_name >> data/queries.log
	rm data/temp.crs
