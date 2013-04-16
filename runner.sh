#!/bin/sh

FIRST=0
SECOND=0
OPERATOR=""
INPUT=""

echo  "\n Welcome to the Kernel Calculator!\n\n"\
  "Print first operand, second operand and operator,\n"\
  "separated by space (for example: 2 + 2, 50 * 3),\n"\
	"or enter E to exit.\n\n"

while true
do
	echo "exp > "
	read INPUT
	if [ "$INPUT" = "E" ] ;
	then
		exit
	fi
	FIRST=`echo $INPUT | grep -Po "^\d+"`
	SECOND=`echo $INPUT | grep -Po "\d+$"`
	OPERATOR=`echo $INPUT | grep -o "[\+\-\*\/]"`
	echo $OPERATOR
	echo $FIRST > /proc/calc_first
	echo $SECOND > /proc/calc_second
	echo $OPERATOR > /proc/calc_operator
	cat /proc/calc_result
done
