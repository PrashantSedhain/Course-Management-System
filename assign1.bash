#!/usr/bin/bash
echo "Enter one of the following actions or press CTRL-D to exit."
echo "C - create a new course record"
echo "R - read an existing course record"
echo "U - update an existing course record"
echo "D - delete an existing course record"
echo "E - update enrolled student count of existing course"
echo "T - show total course count"

read selection
declare -u fselection=$selection

if [ $fselection = "C" ]
then
	./create.bash
elif [ $fselection = "R" ]
then 
	./test.bash
elif [ $fselection = "D" ]
then
	./delete.bash
fi

