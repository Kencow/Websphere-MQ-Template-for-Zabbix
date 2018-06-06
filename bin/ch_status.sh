#!/bin/bash
STATUS=`echo "display chstatus('$2') status"| runmqsc $1|grep STATUS |awk -F\( '{print $2}'|awk -F\) '{print $1}'`

case $STATUS in
	RUNNING)
		echo 1
		;;
	RETRYING)
		echo 2
		;;
	'PAUSED STATE')
		echo 3
		;;
	STOPPED)
		echo 4
		;;
	*)
		echo 0
		;;
esac  

