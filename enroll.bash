#!/bin/bash

read -p "Enter a course department code and number: " rDepCode rCourseNum
read -p "Enter an enrollment change amount: " changeAmount
declare -u fDepCode=$rDepCode
filename=$fDepCode$rCourseNum.crs

if [ ! -f data/$filename ]
then
        echo ERROR: course not found
        exit 1
fi

 	count=1
        while read a b c; do
                if [ $count == "1" ]
                then
                        echo pdept_code=$a > temp.crs
                        echo pdept_name=\"$b $c\" >> temp.crs
                elif [ $count == "2" ]
                then
                        echo pcourse_name=\"$a $b $c\" >> temp.crs
                elif [ $count == "3" ]
                then
                        echo pcourse_schedule=$a >> temp.crs
                        echo pcourse_startDate=$b >> temp.crs
                        echo pcourse_endDate=$c >> temp.crs
                elif [ $count == "4" ]
                then
                        echo pcredit_hours=$a >> temp.crs
                else
                        echo pinitial_enrollment=$a >> temp.crs

                fi

                let count+=1

        done < data/$filename

source temp.crs
echo "$pdept_code $pdept_name" > data/$filename
echo $pcourse_name >> data/$filename
echo $pcourse_schedule $pcourse_startDate $pcourse_endDate >> data/$filename
echo $pcredit_hours >> data/$filename
echo $(( $pinitial_enrollment + $changeAmount )) >> data/$filename
echo $(date) ENROLLMENT: $pdept_code $rCourseNum $pcourse_name >> data/queries.log
echo changed by $changeAmount >> data/queries.log
rm temp.crs
