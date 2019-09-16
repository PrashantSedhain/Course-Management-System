#!/bin/bash
go=0
while [ $go ]; do
	echo "Enter one of the following actions or press CTRL-D to exit."
	echo "C - create a new course record"
	echo "R - read an existing course record"
	echo "U - update an existing course record"
	echo "D - delete an existing course record"
	echo "E - update enrolled student count of existing course"
	echo "T - show total course count"
	
	read selection

	if [ "$selection" = "" ]
	then
		exit 1
	fi

	declare -u fselection=$selection
	if [ "$fselection" = "C" ]
	then
		chmod u+x create.bash
		./create.bash
	elif [ "$fselection" = "R" ]
	then 
		chmod u+x read.bash
		./read.bash
	elif [ "$fselection" = "D" ]
	then
		chmod u+x delete.bash
		./delete.bash
	elif [ "$fselection" = "U" ]
	then
		chmod u+x update.bash
		./update.bash
	elif [ "$fselection" = "T" ]
	then
		chmod u+x total.bash
		./total.bash
	elif [ "$fselection" = "E" ]
	then
		chmod u+x enroll.bash
		./enroll.bash
	else
		echo ERROR: invalid option
	fi
done < a1Input.txt

