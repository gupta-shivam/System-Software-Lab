#!/bin/sh
echo "Enter the no of rows"
read r
i=1

while [ $i -le $r ]
do
	s=`expr $r - $i`
	ct=1
	while [ $ct -le $s ]
	do
		echo -n " "
		ct=`expr $ct + 1`
	done

	ct=1
	while [ $ct -le $i ]
	do
		echo -n "$i "
		ct=`expr $ct + 1`
	done	
	echo
	
	i=`expr $i + 1`
done
