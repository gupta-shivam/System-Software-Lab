#!/bin/sh
Moves=0
hanoi()
{
	if [ $1 -gt 0 ]
	then
    	hanoi `expr $1 - 1` $2 $4 $3
    	echo "Move $2 ----> $4"
    	Moves=$(( $Moves + 1 ))
    	hanoi `expr $1 - 1` $3 $2 $4
    fi
}

clear
echo "\tTOWER OF HANOI PROBLEM"
echo
echo "It consists of three rods, and a number of disks of different sizes which can slide onto any rod. The puzzle starts with the disksin a neat stack in ascending order of size on one rod, the smallest at the top, thus
making a conical shape. The objective of the puzzle is to move the entire stack to another rod, obeying the
following rules:
Only one disk may be moved at a time.
Each move consists of taking the upper disk from one of the rods and sliding it onto another rod, on top of the other disks that may already be present on that rod.
No disk may be placed on top of a smaller disk."
echo
echo
echo
echo "\t\tWE ARE GOING TO MOVE FROM TOWER \"A\" TO TOWER \"C\" USING TOWER \"B\"."
echo
echo
echo "How many different disks are present ? "
echo
read n
if [ $n -lt 0 ]; then
	echo 'Error : Number of disks cannot be negative'
	echo
	exit 1 
fi
echo
hanoi "$n" A B C # move n disks from A to C using B
echo
echo
echo The TOTAL NUMBER of moves required are ":" $Moves
echo
echo
echo "Press <RETURN> to exit"
read junk
clear
return 0
