#!/bin/bash -x

#constant
HUMAN=0

#variables
human_Symbol=0
computer_Symbol=0
count=1

declare -a matrixBoard
function resetBoard()
{
	for (( row=1;row<=9;row++ ))
   	do
 		 matrixBoard[$row]=$count
 		 count=$(( $count+1 ))
	done
}

function check_For_Symbol()
{
  	symbol=$((RANDOM%2))
  	if [ $symbol -eq $HUMAN ]
    	then
		human_Symbol="X"
 	else
  		computer_Symbol="0"
        fi

}

function head_Tail()
{
  	toss=$((RANDOM%2))
  	if [ $toss -eq $HUMAN ]
    	then
		echo "Your Move"
                printBoard

 	else
  		echo "computer Move"
                printBoard

        fi

}

function printBoard()
{ 

 	echo   "| "${matrixBoard[1]}" | "${matrixBoard[2]}" | "${matrixBoard[3]}" |"

 	echo   "| "${matrixBoard[4]}" | "${matrixBoard[5]}" | "${matrixBoard[6]}" |"

 	echo   "| "${matrixBoard[7]}" | "${matrixBoard[8]}" | "${matrixBoard[9]}" |"

}





resetBoard


printBoard
check_For_Symbol
head_Tail
