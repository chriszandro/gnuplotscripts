#bash/bin

for FILE in *.dia; do
mkdir -p ./png/

echo "Processing $FILE"
gnuplot <<- EOF

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

  #set logscale x 

  #PNG OUTPUT
#------------------------------------------
#  set term png medium font arial 10
  set term pngcairo font "Arial, 10"
  set output "./png/${FILE}.png" 

  set title "System ${FILE}"
  
    # --- GRAPH System
    set title "${FILE}"
    set xlabel "Voltage [V]"
    set ylabel "Energy [eV]"
    plot "${FILE}" using 1:2 with lines linestyle 1 title "Energy 1", "${FILE}" using 1:3 with lines linestyle 2 title "Energy 2", "${FILE}" using 1:4 with lines linestyle 3 title "3", "${FILE}" using 1:5 with lines linestyle 4 title "4", "${FILE}" using 1:6 with lines linestyle 5 title "5", "${FILE}" using 1:7 with lines linestyle 6 title "6", "${FILE}" using 1:8 with lines linestyle 7 title "7", "${FILE}" using 1:9 with lines linestyle 8 title "8", "${FILE}" using 1:10 with lines linestyle 11 title "11"


EOF
done
