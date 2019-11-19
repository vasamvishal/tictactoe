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
function reset_Board()
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
                computer_Symbol="O"
              

 	else
		human_Symbol="O"
  		computer_Symbol="X"

        fi

}

function row_Winning()
{

       local rowVariable=1
       var=$1
       for ((count=1;count<=3;count++ ))
       do       
		local countnumber=0;      
                rowVariable=$rowVariable  
		rowEnd=$(( $rowVariable+2 ))
		for ((rowLoop=$rowVariable;rowLoop<=$rowEnd;rowLoop++ ))
               	do 
			if [ ${matrixBoard[$rowLoop]} == $var ]
        		then
                		countnumber=$(($countnumber+1))
                        if [ $countnumber -eq 2 ]
                        then	
				local loop
				for (( loop=$rowVariable; loop<=$rowEnd; loop++ ))
                		do
				if [ ${matrixBoard[$loop]} ==  $human_Symbol ] || [ ${matrixBoard[$loop]} ==  $computer_Symbol ]
				then
 				count5=0;
				else
				echo  $loop
				fi
				done
                	elif [ $countnumber -eq 3 ]
                	then
                               echo "Suceess"
                 		break;
                	fi
        		fi
		done
		rowVariable=$(($rowLoop))
	done
}

function column_Winning()
{

       local column=1
       var=$1
       for ((columncount=1;columncount<=3;columncount++ ))
       do       
		local countnumber=0      
                columnStart=$column
                columnEnd=$(( $columnStart+6 ))
		for (( columnLoop=$columnStart;columnLoop<=$columnEnd;columnLoop=$(($columnLoop+3)) ))
               	do 
			if [ ${matrixBoard[$columnLoop]} == $var ]
        		then
                		countnumber=$(($countnumber+1))
			if [ $countnumber -eq  2 ]
	                then 
				local loop
                        	for (( loop=$columnStart; loop<=$columnEnd; loop=$(($loop+3)) ))
                                do
                                if [ ${matrixBoard[$loop]} == $human_Symbol ] || [ ${matrixBoard[$loop]} == $computer_Symbol ]
                                then
                                count5=0;
                                else
                                echo  $loop
                                fi
                                done

                	elif [ $countnumber -eq 3 ]
                	then
                               echo " column Suceess"
                 		break;
                	fi
        		fi
		done
		column=$(($columnStart+1))
	done
}



function diagonal_Winning()
{

        local diagonal=1
        local diagonalcounter=9
        local countnumber=0
	local diagonalValue=$diagonal
	var=$1
	for (( diagonalloop=$diagonal;diagonalloop<=$diagonalcounter;diagonalloop=$(($diagonalloop+4)) ))
	do 
                
		if [ ${matrixBoard[$diagonalloop]} == $var ]
        	then
			countnumber=$(($countnumber+1))

		if [ $countnumber -eq 2 ]
                then
			 local loop
               		 for (( loop=$diagonalValue; loop<=$diagonalcounter; loop=$(($loop+4)) ))
                                do
                                if [ ${matrixBoard[$loop]} == $human_Symbol ] || [ ${matrixBoard[$loop]} == $computer_Symbol ]
                                then
                                count5=0;
                                else
                                echo  $loop
                                fi
                                done

                elif [ $countnumber -eq 3 ]
                then
                	echo " diagonal Suceess"
                 	break;
                fi
                     
        	fi
		diagonal=$diagonalloop
	done
}


function anti_Diagonal_Winning()
{

        local diagonal=3
        local diagonalcounter=7
        local countnumber=0
	local diagonalValue=$diagonal
	var=$1
        for (( diagonalloop=$diagonal;diagonalloop<=$diagonalcounter;diagonalloop=$(($diagonalloop+2)) ))
        do   
                if [ ${matrixBoard[$diagonalloop]} == $var ]
                then
                        countnumber=$(($countnumber+1))
                if [ $countnumber == 2 ]
                then
			 for (( loop=$diagonalValue; loop<=$diagonalcounter; loop=$(($loop+2)) ))
                                do
                                if [ ${matrixBoard[$loop]} == $human_Symbol ] || [ ${matrixBoard[$loop]} == $computer_Symbol ]
                                then
					count5=0;                               
                                else
                                echo  $loop
                                fi
                                done

                elif [ $countnumber -eq 3 ]
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
function play_Game()
{
        check_For_Symbol
	echo $human_Symbol
	echo $computer_Symbol
        while [ true  ]
	do
	for((count1=1;count1<=1;count1++))
        do
	if [ $count1 -eq 1 ]
	then	
		print_Board
		read -p "Entered the position u want to enter:" move
		while [ true ]
		do
                if [ ${matrixBoard["$move"]} == $computer_Symbol ] || [ ${matrixBoard["$move"]} == $human_Symbol ] 
                then
                        echo "cannot enter"
                        echo "Enter Again "
                        read -p "Entered the position u want to enter:" move

		
		else
		break;
		fi
		done
                	matrixBoard["$move"]=$human_Symbol
	        	
                	row_Winning $human_Symbol
 			column_Winning $human_Symbol
                	diagonal_Winning $human_Symbol
			anti_Diagonal_Winning $human_Symbol
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

function print_Board()
{ 

 	echo   "| "${matrixBoard[1]}" | "${matrixBoard[2]}" | "${matrixBoard[3]}" |"

 	echo   "| "${matrixBoard[4]}" | "${matrixBoard[5]}" | "${matrixBoard[6]}" |"

 	echo   "| "${matrixBoard[7]}" | "${matrixBoard[8]}" | "${matrixBoard[9]}" |"

}

reset_Board
head_Tail
play_Game


