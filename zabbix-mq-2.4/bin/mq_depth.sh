
echo "dis q('$2') curdepth"| runmqsc $1|grep CURDEPTH|awk -F\( '{print $2}'|awk -F\) '{print $1}'

