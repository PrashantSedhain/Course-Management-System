#!/usr/bin/bash

read dept_code
read dept_name
read course_number
read course_name
read course_schedule
read course_startDate
read course_endDate
read credit_hours
read initial_enrollment

if [ ! -f data/$dept_code$course_number ]
then 
	echo ERROR: course not found
else
	# if the department code is updated, do you want us to create a new file or update the existing one?
	
	if [ $dept_code -ne "" ]
	then
		echo $dept_code $dept_name > data/$fileName

        echo $course_name >> data/$fileName
        echo $course_schedule $course_startDate $course_endDate >> data/$fileName
        echo $credit_hours >> data/$fileName
        echo $initial_enrollment >> data/$fileName
        echo $(date) UPDATED: $dept_code $course_number $course_name >> data/queries.log	
