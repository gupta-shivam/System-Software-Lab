#!/bin/sh
echo "Enter Upper bound of average time"
read y
ct=0
while true;
do
	echo "Enter y to terminate"
	read c	
	if [ -z $c ];then 
		c="n" 
	fi
	if [ $c == "y" ];then 
		break
	fi
	
	echo "Enter a new participant"
	read str
	
	if [ -z $str ];then
		echo "Empty name is invalid "
		continue
	fi
	
	i=0
	mark=0
	while [ $i -lt $ct ];
	do
		if [ ${array[$i]} == $str ];then
			mark=1
			break
		fi
		i=`expr $i + 1`
	done	
	if [ $mark -eq 1 ];then
		echo "Duplicate name"
		continue
	fi
	array[$ct]=$str
	ct=`expr $ct + 1`	
	
	j=1
	sum=0.0
	while [ $j -le 5 ];
	do
		echo "Enter Race $j time: "
		read val
		sum=$(echo $sum + $val | bc -l);
		j=`expr $j + 1`		
	done
	average=$(echo $sum / 5 | bc -l)
	
	echo "Average is $average"
	echo "Threshold is $y"
	ch=`echo "$y < $average" | bc`
	if [ $ch -eq 1 ];then
		echo "Close, but you did not make it."
	else
		echo "$str Welcome to the team."
	fi	

done
