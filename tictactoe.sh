#!/bin/bash -x

#constant
HUMAN=0

#variables
human_Symbol=0
computer_Symbol=0
count=1
countnumber=0
times_played=0
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
                computer_Symbol="0"
              

 	else
		human_Symbol="0"
  		computer_Symbol="X"

        fi

}

function rowwinning()
{

       local row1=1
       var=$1
       for ((count=1;count<=3;count++ ))
       do       
		local countnumber=0;      
                row1=$row1  
		counter=$(( $row1+2 ))
		for ((row2=$row1;row2<=$counter;row2++ ))
               	do 
			if [ ${matrixBoard[$row2]} == $var ]
        		then
                		countnumber=$(($countnumber+1))
                	if [ $countnumber -eq 3 ]
                	then
                               echo "Suceess"
                 		break;
                	fi
        		fi
		done
		row1=$(($row2))
	done
}

function columnwinning()
{

       local column=1
       var=$1
       for ((loopcount=1;loopcount<=3;loopcount++ ))
       do       
		local countnumber=0;
		local columncountnumber=0;      
                column1=$column
                columncounter=$(( $column1+6 ))
		for (( column2=$column1;column2<=$columncounter;column2=$(($column2+3)) ))
               	do 
			if [ ${matrixBoard[$column2]} == $var ]
        		then
                		countnumber=$(($countnumber+1))
                	if [ $countnumber -eq 3 ]
                	then
                               echo "Suceess"
                 		break;
                	fi
        		fi
		done
		column=$(($column1+1))
	done
}



function diagonalwinning()
{

        local diagonal=1
        local diagonalcounter=9
        local countnumber=0
	var=$1
	for (( diagonalloop=$diagonal;diagonalloop<=$diagonalcounter;diagonalloop=$(($diagonalloop+4)) ))
	do 
                
		if [ ${matrixBoard[$diagonalloop]} == $var ]
        	then
			countnumber=$(($countnumber+1))
                if [ $countnumber -eq 3 ]
                then
                               echo " diagonal Suceess"
                 		break;
                fi
                     
        	fi
		diagonal=$diagonalloop
	done
}


function antidiagonalwinning()
{

        local diagonal=3
        local diagonalcounter=9
        local countnumber=0
	var=$1
        for (( diagonalloop=$diagonal;diagonalloop<=$diagonalcounter;diagonalloop=$(($diagonalloop+2)) ))
        do   
                if [ ${matrixBoard[$diagonalloop]} == $var ]
                then
                        countnumber=$(($countnumber+1))
                if [ $countnumber -eq 3 ]
                then
                               echo " diagonal Suceess"
                                break;
                fi

                fi
                diagonal=$diagonalloop
        done
}

function head_Tail()
{
  	toss=$((RANDOM%2))
  	if [ $toss -eq $HUMAN ]
    	then
		echo "Your Move"
 	else
  		echo "computer Move"               

        fi

}
function play()
{
	echo $human_Symbol
	echo $computer_Symbol
        while [ true  ]
	do
	for((count1=1;count1<=1;count1++))
        do
	if [ $count1 -eq 1 ]
	then	
               
		printBoard
	        read -p "Entered the position u want to enter:" move
		while [ true ]
		do
                if [ ${matrixBoard["$move"]} -eq "$computer_Symbol" ] || [ ${matrixBoard["$move"]} -eq "$human_Symbol" ] 
                then
                        echo "cannot enter"
                        echo "Enter Again "
                        read -p "Entered the position u want to enter:" move

		
		else
		break;
		fi
		done
                	matrixBoard["$move"]=$human_Symbol
	        	printBoard
                	rowwinning $human_Symbol
 			columnwinning $human_Symbol
                	diagonalwinning $human_Symbol
			antidiagonalwinning $human_Symbol
                        
			times_played=$(( $times_played+1 ))
		 	if [ $times_played -ge 9 ]
			then
			echo "tie"
			break;
			fi
			
		
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

check_For_Symbol
play


