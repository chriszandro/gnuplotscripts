#bash/bin

mkdir -p ./prob

for FILE in *.prob; do

echo "Processing $FILE for IV Characteristics"
gnuplot <<- EOF

set style line 80 lt rgb "#000000"

#Grid	
  set style line 81 lt 1  # dashed
  set style line 81 lt rgb "#808080"  # grey
  set grid back linestyle 81
  set border 3 back linestyle 80
  set xtics nomirror
  set ytics nomirror

#Legend
  
  set key bottom right
  
  set style line 1 lt rgb "#A00000" lw 2 pt 1
  set style line 2 lt rgb "#00A000" lw 2 pt 6
  set style line 3 lt rgb "#5060D0" lw 2 pt 2
  set style line 4 lt rgb "#F25900" lw 2 pt 9
  set style line 5 lt rgb "#F25900" lw 1 pt 4


#PNG OUTPUT
#------------------------------------------
 # set term png medium font arial 8
  set term pngcairo font "Arial, 10"

  set output "./prob/${FILE}.png" 

  set xtics (-0.6,0.695,4.61,2.0,3.3,5.95)
  set grid xtics

    set title "Probability"
    set xlabel "Voltage [V]"
    set ylabel "Probability"
    plot "${FILE}" using 1:2 with lines linestyle 3 title "Left", "${FILE}" using 1:3 with lines linestyle 2 title "Right"
EOF
done
