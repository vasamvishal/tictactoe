#!/bin/bash -x

#constant
HUMAN=0

#variables
human_Symbol=0
computer_Symbol=0
count=1
row1=0
countnumber=0

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
                echo $human_Symbol
 	else
  		computer_Symbol="0"
 		echo $computer_Symbol
        fi

}

function rowwinning()
{
        var=$1
        row1=$(( $row1+1 ))
	if [ matrixBoard["$row1"]==$var && matrixBoard["$row1+1"]==$var] || [matrixBoard["$row1"]==$var && matrixBoard["$row1+2"]==$var ]
        then
        countnumber=$(( $countnumber+1 ))
        else
        row1=$(( $row1+3 ))

        if [ $countnumber -eq 1 ]
        then
            echo "Sucess"
        fi

        fi

}

function columnwinning()
{
      var=$1
      
	if [ matrixBoard["$col"]==$var && matrix]
        then
            count= $(( $count+1 ))
        if [ $count -eq 3 ]
        then
            echo "Sucess"
        fi
	
	fi
}

function head_Tail()
{
  	toss=$((RANDOM%2))
  	if [ $toss -eq $HUMAN ]
    	then
		echo "Your Move"
                play               
 	else
  		echo "computer Move"
                printBoard

        fi

}
function play()
{
                while [ true  ]
		do
                  var=$( check_For_Symbol )
		for((count=1;count<=2;count++))
                do
			if [ $count -eq 1 ]
			then	
			printBoard
	                echo $var
	                read -p "Entered the position u want to enter:" move
			matrixBoard["$move"]=$var
	                printBoard
                        rowwinning $var
			else
			play		
			fi
		done
		done

}

function printBoard()
{ 

 	echo   "| "${matrixBoard[1]}" | "${matrixBoard[2]}" | "${matrixBoard[3]}" |"

 	echo   "| "${matrixBoard[4]}" | "${matrixBoard[5]}" | "${matrixBoard[6]}" |"

 	echo   "| "${matrixBoard[7]}" | "${matrixBoard[8]}" | "${matrixBoard[9]}" |"

}





resetBoard
head_Tail

