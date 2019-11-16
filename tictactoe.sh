#!/bin/bash -x

declare -a matrixBoard
count=1
function resetBoard()
{
for (( row=1;row<=9;row++ ))
do
  matrixBoard[$row]=$count
  count=$(( $count+1 ))
done
}
function printBoard()
{ 
 echo   "|"${matrixBoard[1]}"|"${matrixBoard[2]}"|"${matrixBoard[3]}"|"
 echo   "|"${matrixBoard[4]}"|"${matrixBoard[5]}"|"${matrixBoard[6]}"|"
 echo   "|"${matrixBoard[7]}"|"${matrixBoard[8]}"|"${matrixBoard[9]}"|"
}

resetBoard
printBoard
