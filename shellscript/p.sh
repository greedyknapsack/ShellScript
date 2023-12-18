#sort t.txt -o t1.txt
r="1"
cat student_database.txt | grep ^"|$r|" 
#cat student_database2.txt >student_database1.txt
echo "Roll|Name|Dept|Grade|" > student_database2.txt
grep -v -n "^|$r|" student_database1.txt
#grep -v "|Roll|Name|Dept|Grade|" student_database1.txt | cut -d "|" -f 2-  | sort -n >>student_database2.txt
echo "|"grep -v "|Roll|Name|Dept|Grade|" student_database1.txt | cut -d "|" -f 2- | sort -n | tr -s ' ' '|' >>student_database2.txt

grep -v -n "^|$r|" student_database1.txt
