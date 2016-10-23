pause()
{
	echo
	echo "Press <q> to quit" 
	echo "Press <return> to continue"
	read junk
	if [ "$junk" = "q" -o "$junk" = "Q" ]; then
		return 0
	else
		return 1
	fi
}

while true
do
	clear
	echo "\tSIMPLE CALCULATOR"
	echo
	echo -n "Enter two values: "
	read a b
	if [ "$a" = "" -o "$b" = "" ]; then
		echo
		echo 'ERROR : Please enter Two Numbers'
	if pause
	then
		return 0
	fi
		continue
	fi
	echo -n "Enter operand (+,-,/,*,%): "
	read op
	if [ "$op" = "" ]; then
		echo
		echo 'ERROR : Please enter Operator'
	if pause
	then
		return 0
	fi
		continue
	fi

	if [ "$op" = "+" ]
	then
		echo "Output : $a $op $b = `expr $a + $b`"
	elif [ "$op" = "-" ]
	then
		echo "Output : $a $op $b = `expr $a - $b` "
	elif [ "$op" = "*" ]
	then
		echo "Output : $a $op $b = `expr $a \* $b`"
	elif [ "$op" = "/" ]
	then
		echo "Output : $a $op $b = `expr $a / $b`"
	elif [ "$op" = "%" ]
	then
		echo "Output : $a $op $b = `expr $a % $b`"
	else
		echo "ERROR : Wrong Operator"
		echo "Please Try Again"
	fi
	if pause
	then
		return 0
	fi
done
