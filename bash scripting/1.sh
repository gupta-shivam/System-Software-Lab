#!/bin/sh
if [ -d "$1" ]; then
	list=`find "$1" ! -type d`
	maxlen=0
	maxfile=""
	for i in ${list[@]}; do
		curfile=`basename "$i"`
		# echo $curfile
		curlen=`echo $curfile | wc -c`
		# echo $curlen
		if [ $curlen -gt $maxlen ]; then
			maxlen=$curlen
			maxfile=$curfile		
		fi
	done
	echo Filename with maximum length is $maxfile
	return 0
else
	echo 'WRONG INPUT : PLEASE INPUT A DIRECTORY'
	echo 'Usage : 1.sh Directory'
	return 1
fi