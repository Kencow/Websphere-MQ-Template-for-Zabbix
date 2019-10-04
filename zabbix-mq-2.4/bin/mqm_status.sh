#!/bin/bash
dspmq -m $1 -o status|grep -i running|grep -v elsewhere > /dev/null
if [ $? -eq 0 ]; then
 echo 1
else
 echo 0
fi
