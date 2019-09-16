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
