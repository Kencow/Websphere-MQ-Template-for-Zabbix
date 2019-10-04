#!/bin/bash

length_cur=1

mqmarray=(`dspmq|egrep -i "$1"|awk -F\) '{print $1}'|awk -F\( '{print $2}'   2>/dev/null`)
length_mqm=${#mqmarray[@]}

printf "{\n"
printf  '\t'"\"data\":["
for ((i=0;i<$length_mqm;i++))
do
	q_array_c=(`echo "dis ql(*)" |runmqsc ${mqmarray[$i]}|grep "QUEUE("|grep -v SYSTEM|awk -F\) '{print $1}'|awk -F\( '{print $2}' 2>/dev/null`)
	length_q_c=${#q_array_c[@]}

	let "length_all = $length_all + $length_q_c"
done

for ((i=0;i<$length_mqm;i++))
do
        q_array=(`echo "dis ql(*)" |runmqsc ${mqmarray[$i]}|grep "QUEUE("|grep -v SYSTEM|awk -F\) '{print $1}'|awk -F\( '{print $2}' 2>/dev/null`)
        length_q=${#q_array[@]}


	for ((k=0;k<$length_q;k++))

	do
		printf '\n\t\t{'
		printf "\"{#Q_NAME}\":\"${mqmarray[$i]} ${q_array[$k]}\"}"
		if [ $length_cur -lt $[length_all] ];then
                	printf ','
        	fi
		let "length_cur = $length_cur +1"
	done
done

printf  "\n\t]\n"
printf "}\n"

