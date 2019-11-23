#!/bin/bash -x

#constant
HUMAN=0

#variables
human_Symbol=0
computer_Symbol=0
count=1
rowNew=0
newBlockVariable=0
newWinVariable=0
antiDiagonalVariable=0
diagonalVariable=0
rowPosition=0
columnPosition=0
countNumber=0
times_Played=0
variable=0
counting=0
true=0
sucess="false"
declare -a matrixBoard


function print_Board()
{ 
 
 	echo   "| "${matrixBoard[1]}" | "${matrixBoard[2]}" | "${matrixBoard[3]}" |"
 	echo   "| "${matrixBoard[4]}" | "${matrixBoard[5]}" | "${matrixBoard[6]}" |"
 	echo   "| "${matrixBoard[7]}" | "${matrixBoard[8]}" | "${matrixBoard[9]}" |"
}
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
				rowPosition=$loop
				fi
				done
	
			
                	elif [ $countnumber -eq 3 ]
                	then
				true=1;
                 		break;

        		fi
			fi
		done
		if [ $true == 1 ]
                then
                        sucess="true";
                fi

		rowVariable=$(($rowLoop))
	done
	echo $rowPosition 


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
                                columnPosition=$loop
                               
                                fi
                                done

                	elif [ $countnumber -eq 3 ]
                	then
				true=1
                               echo "true"
                 		
                	
        		fi
			fi
		done
		if [ $true == 1 ]
                then
                        sucess="true";
                fi

		column=$(($columnStart+1))
	done
	echo $columnPosition
}
function diagonal_Winning()
{
        local diagonal=1
        local diagonalCounter=9
        local countnumber=0
	local diagonalValue=$diagonal
	var=$1
	for (( diagonalLoop=$diagonal;diagonalLoop<=$diagonalCounter;diagonalLoop=$(($diagonalLoop+4)) ))
	do 
		if [ ${matrixBoard[$diagonalLoop]} == $var ]
        	then
			countnumber=$(($countnumber+1))
		if [ $countnumber -eq 2 ]
                then 
			 local loop
               		 for (( loop=$diagonalValue; loop<=$diagonalCounter; loop=$(($loop+4)) ))
                                do
                                if [ ${matrixBoard[$loop]} == $human_Symbol ] || [ ${matrixBoard[$loop]} == $computer_Symbol ]
                                then
                                count5=0;
                                else
                                diagonalVariable=$loop
                                fi
                                done
                elif [ $countnumber -eq 3 ]
                then
			true=1;
                	echo " diagonal Suceess"
                 	break;
        	fi
		fi
		if [ $true == 1 ]
                then
                        sucess="true";
                fi

		diagonal=$diagonalloop
	done
	echo $diagonalVariable 
}
function anti_Diagonal_Winning()
{
        local diagonal=3
        local diagonalCounter=7
        local countnumber=0
	local diagonalValue=$diagonal
	var=$1
        for (( diagonalLoop=$diagonal;diagonalLoop<=$diagonalCounter;diagonalLoop=$(($diagonalLoop+2)) ))
        do   
                if [ ${matrixBoard[$diagonalLoop]} == $var ]
                then
                        countnumber=$(($countnumber+1))
                if [ $countnumber == 2 ]
                then  
			for (( loop=$diagonalValue; loop<=$diagonalCounter; loop=$(($loop+2)) ))
                        do
                      		if [ ${matrixBoard[$loop]} == $human_Symbol ] || [ ${matrixBoard[$loop]} == $computer_Symbol ]
                                then
					count5=0;                               
                                else
                                antiDiagonalVariable=$loop
                                fi
			
                                done

                elif [ $countnumber -eq 3 ]
                then
			true=1;
                	echo " diagonal Suceess"
                        break;
               
                fi
		fi
		if [ $true == 1 ]
		then
			sucess="true";
		fi
                diagonal=$diagonalLoop
        done
	echo $antiDiagonalVariable
}

function head_Tail()
{
  	toss=$((RANDOM%2))
  	if [ $toss -eq $HUMAN ]
    	then
		HUMAN=$(($HUMAN+1 ))
 	else
  		echo "computer Move"               
        fi

}
function check_For_Winposition()
{
		if  [[ $human_Symbol -eq  $Symbol ]] && [[ $rowNewPosition -gt  0 ]]
                then                  	
                        newWinVariable=$rowNewPosition	
                elif  [[ $human_Symbol -eq  $Symbol ]] && [[ $columnNewPosition -gt  0 ]]
                then          
			newWinvariable=$columnNewPosition
                elif  [[ $human_Symbol -eq  $Symbol ]] && [[ $diagonalNewVariable -gt  0 ]]
                then
			newWinVariable=$diagonalNewVariable
                elif [[ $human_Symbol -eq  $Symbol ]] && [[ $antiDiagonalNewVariable -gt  0 ]]
                then
			newWinVariable=$antiDiagonalNewVariable
                fi
	echo $newWinVariable
	newWinVariable=0
}
 function check_For_Blockposition()
{
	
		if [[ $computer_Symbol -eq  $Symbol ]] && [[ $rowPosition -gt  0 ]] 
                then                  	
                       newBlockVariable=$rowPosition
			
                elif  [[ $computer_Symbol -eq  $Symbol ]] && [[ $columnPosition -gt  0 ]] 
                then
          
			newBlockVariable=$columnPosition
                elif  [[ $computer_Symbol -eq  $Symbol ]] && [[ $diagonalVariable -gt  0 ]] 
                then
			newBlockVariable=$diagonalVariable
                elif [[ $computer_Symbol -eq  $Symbol ]] && [[ $antidiagonalvariable -gt  0 ]] 
                then
			newBlockVariable=$antiDiagonalVariable
                fi
	echo $newBlockVariable
	newBlockVariable=0
}

function move_Check()
{
	move=$1
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

} 
function play_Game()
{
	check_For_Symbol
	echo $human_Symbol
	echo $computer_Symbol  
        while [ true  ]
	do
		rowNewPosition=0
                columnNewPosition=0
                diagonalNewVariable=0
                antiDiagonalVariable=0
		rowPosition=0
		columnPosition=0
		diagonalVariable=0
		antiDiagonalVariable=0
	for(( count1=1;count1<=2;count1++ ))
        do
		echo $count1
		if [ $count1 -eq 1 ]
		then
			Symbol=$human_Symbol
			echo "Human symbol" $human_Symbol
		else
			Symbol=$computer_Symbol
			echo "symbol" $Symbol		
		fi
			local checkForBlockPosition=0
			local checkForWinPosition=0
			print_Board
		if [ $count1 -eq 2 ]
		then
			checkForBlockPosition=$(check_For_Blockposition())
			checkForWinPosition=$(check_For_Winposition())
			
		fi
		if [ $checkForWinposition -gt 0 ]
		then
			matrixBoard["$checkforwinposition"]=$Symbol
			print_Board
			
		break;
		fi
		if [ $checkForBlockPosition -gt 0 ]
		then
			matrixBoard["$var"]=$Symbol
			print_Board
    			
		break;
		
		fi
		if [ $count1 -eq 2 ]
		then
			rowPosition=$(row_Winning $Symbol) 
                        columnPosition=$(column_Winning $Symbol)
                        diagonalVariable=$(diagonal_Winning $Symbol)
                        antiDiagonalVariable=$(anti_Diagonal_Winning $Symbol)
			if [ $sucess==true ]
			then
				break;
			fi
			for (( Counting=1;Counting<10;Counting=$(( $Counting+2 )) ))
			do
                	if [[ ${matrixBoard["$Counting"]} == $computer_Symbol ]] || [[ ${matrixBoard["$Counting"]} == $human_Symbol ]] 
        	        then
				count5=0;
			else
				matrixBoard["$Counting"]=$computer_Symbol
				print_Board
				break;
			elif  [[ ${matrixBoard[5]} ==  $computer_Symbol ]] || [[ ${matrixBoard[5]} == $human_Symbol ]]
                        then
                                matrixBoard[5]=$computer_Symbol

			elif [[ ${matrixBoard[$cornerLoop]} ==  $computer_Symbol ]] || [[ ${matrixBoard[$cornerloop]} == $human_Symbol ]]
                        then
				
				count5=0;
			else
		  	for (( cornerloop=2;cornerLoop<9;cornerloop=$(($cornerloop+2)) ))
                       	do
                                matrixBoard["$cornerloop"]=$computer_Symbol
				break;
                        fi 
 			done
			
			fi
			fi

	                if [ $Counting -eq 3 ]
			then
				Counting=$(( $Counting+2 ))
                	fi
			done

			
		elif [ $count1 -eq 1 ]
		then
			read -p "Entered the position u want to enter:" move
			move_Check $move
			matrixBoard["$move"]=$Symbol
                	rowPosition=$(row_Winning $Symbol) 
 			columnPosition=$(column_Winning $Symbol)
                	diagonalVariable=$(diagonal_Winning $Symbol)
			antiDiagonalVariable=$(anti_Diagonal_Winning $Symbol)
			if [ $sucess==true ]
                        then
                                break;
                        fi

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

reset_Board
head_Tail
play_Game


