#!/bin/bash
mqmarray=(`dspmq|awk -F\) '{print $1}'|awk -F\( '{print $2}'   2>/dev/null`)
length=${#mqmarray[@]}
printf "{\n"
printf  '\t'"\"data\":["
for ((i=0;i<$length;i++))
do
        printf '\n\t\t{'
        printf "\"{#MQM_NAME}\":\"${mqmarray[$i]}\"}"
        if [ $i -lt $[$length-1] ];then
                printf ','
        fi
done
printf  "\n\t]\n"
printf "}\n"
