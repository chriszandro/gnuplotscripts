#!bin/bash

echo set style line 80 lt rgb "#000000" >> ./setplot.gnu

echo set style line 81 lt 0  >> ./setplot.gnu
echo set style line 81 lt rgb "#808080"   >> ./setplot.gnu
echo set grid back linestyle 81  >> ./setplot.gnu
echo  set border 3 back linestyle 80  >> ./setplot.gnu
echo  set xtics nomirror  >> ./setplot.gnu
echo  set ytics nomirror  >> ./setplot.gnu

#Lines
  
echo  set style line 1 lt rgb "#A00000" lw 2 pt 1  >> ./setplot.gnu
echo  set style line 2 lt rgb "#00A000" lw 2 pt 6  >> ./setplot.gnu
echo  set style line 3 lt rgb "#5060D0" lw 2 pt 2  >> ./setplot.gnu
echo  set style line 4 lt rgb "#F25900" lw 2 pt 9  >> ./setplot.gnu
echo  set style line 5 lt rgb "#F25900" lw 1 pt 4  >> ./setplot.gnu

