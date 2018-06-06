#!/bin/bash

length_cur=1

mqmarray=(`dspmq |awk -F\) '{print $1}'|awk -F\( '{print $2}'   2>/dev/null`)
length_mqm=${#mqmarray[@]}

printf "{"
printf  "\"data\":["
for ((i=0;i<$length_mqm;i++))
do
	q_array_c=(`echo "display channel(*)" |runmqsc ${mqmarray[$i]}|grep "CHANNEL("|grep -v SYSTEM|awk -F\) '{print $1}'|awk -F\( '{print $2}' 2>/dev/null`)
	length_q_c=${#q_array_c[@]}

	let "length_all = $length_all + $length_q_c"
done

for ((i=0;i<$length_mqm;i++))
do
        q_array=(`echo "display channel(*)" |runmqsc ${mqmarray[$i]}|grep "CHANNEL("|grep -v SYSTEM|awk -F\) '{print $1}'|awk -F\( '{print $2}' 2>/dev/null`)
        length_q=${#q_array[@]}
	

	for ((k=0;k<$length_q;k++))

	do
		printf '{'
		printf "\"{#CH_NAME}\":\"${mqmarray[$i]} ${q_array[$k]}\"}"
		if [ $length_cur -lt $[length_all] ];then
                	printf ','
        	fi
		let "length_cur = $length_cur +1"
	done
done

printf  "]"
printf "}"

