read -p "Enter a course department code and number: " rDepCode rCourseNum

filename=$rDepCode$rCourseNum.crs

count=0

if [ ! -f data/$filename ]
then
        echo ERROR: course not found
        exit 1
fi

while read a; do
        if [ $count == 4 ]
        then
                
                echo $(date) DELETED: $rDepCode $rCourseNum $a >> data/queries.log
                
                exit 0

        fi
        let count+=1
done < data/$filename

