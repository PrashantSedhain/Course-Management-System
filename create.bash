#!/usr/bin/bash
export read dept_code
export read dept_name
export read course_number
export read course_name
export read course_schedule
export read course_startDate
export read course_endDate
export read credit_hours
export read initial_enrollment

declare -l depName=$dept_code
fileName=$depName$course_number.crs

if [ -f data/$fileName ]
then
	echo ERROR: course already exists

else
	echo $dept_code $dept_name > data/$fileName
	echo $course_name >> data/$fileName
	echo $course_schedule $course_startDate $course_endDate >> data/$fileName
	echo $credit_hours >> data/$fileName
	echo $initial_enrollment >> data/$fileName
	echo $(date) CREATED: $dept_code $course_number $course_name >> data/queries.log
fi
