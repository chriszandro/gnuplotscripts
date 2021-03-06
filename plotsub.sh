#bash/bin

for FILE in *.sub; do
mkdir -p ./sub/

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

 set logscale y
 set yrange[0.1:1.2]

  #PNG OUTPUT
#------------------------------------------
#  set term png medium font arial 10
  set term pngcairo font "Arial, 10"
  set output "./sub/${FILE}.png" 
  s(x,y) = sqrt(x*x+y*y)
  t(x,y) = atan(x/y)
  set title "System ${FILE}"
  
    # --- GRAPH System
    set title "${FILE}"
    set xlabel "Voltage [V]"
    set ylabel "Occupation"
    plot "${FILE}" using 1:2 with lines linestyle 1 title "Population p1", "${FILE}" using 1:3 with lines linestyle 2 title "Population p2", "${FILE}" using 1:4 with lines linestyle 3 title "Real Coherence rho12", "${FILE}" using 1:5 with lines linestyle 4 title "Complex Coherence rho12",  "${FILE}" using 1:s(4,5) with lines linestyle 6 title "Betrag", "${FILE}" using 1:(5/4) with lines linestyle 7 title "winkel"


EOF
done
