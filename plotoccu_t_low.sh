#bash/bin

for FILE in *.p1; do
mkdir -p ./png/

echo "Processing $FILE"
gnuplot <<- EOF

set logscale x

set style line 80 lt rgb "#000000"

#Grid	
  set style line 81 lt 0  # dashed
  set style line 81 lt rgb "#808080"  # grey
  set grid back linestyle 81
  set border 3 back linestyle 80
  set xtics nomirror
  set ytics nomirror

#Legend
  
  set key top center
  set key on

  set style line 1 lt rgb "#A00000" lw 2 pt 1
  set style line 2 lt rgb "#00A000" lw 2 pt 6
  set style line 3 lt rgb "#5060D0" lw 2 pt 2
  set style line 4 lt rgb "#F25900" lw 2 pt 9
  set style line 5 lt rgb "#A25900" lw 2 pt 9
  
  set style line 6 lt rgb "#F259A0" lw 2 pt 9
  set style line 7 lt rgb "#02F909" lw 2 pt 9
  set style line 8 lt rgb "#C200FF" lw 2 pt 9
  set style line 9 lt rgb "#025934" lw 2 pt 9
  set style line 10 lt rgb "#02A9F0" lw 2 pt 9

  set style line 11 lt  rgb "#F259A0" lw 2 pt 9
  set style line 12 lt  rgb "#02F909" lw 2 pt 9
  set style line 13 lt  rgb "#C200FF" lw 2 pt 9
  set style line 14 lt  rgb "#025934" lw 2 pt 9
  set style line 15 lt  rgb "#02A9F0" lw 2 pt 9

  set logscale x 
  set logscale y

  #PNG OUTPUT
#------------------------------------------
  set term pngcairo dashed font "Arial, 10" 
  set output "./png/${FILE}.png" 
  set key top left
  set title "System ${FILE}"
  
    # --- GRAPH System
    set title "${FILE}"
    set xlabel "Voltage [V]"
    set ylabel "Occupation"
    plot for[i=2:15] "${FILE}" using 1:i every 1 with lines title "Nr.".(i-1)

EOF
done
