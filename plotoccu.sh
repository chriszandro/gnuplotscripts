#bash/bin

for FILE in *.p1; do
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

  #PNG OUTPUT
#------------------------------------------
#  set term png medium font arial 10
  set term pngcairo font "Arial, 10"
  set output "./png/${FILE}.png" 

  set title "System ${FILE}"
  
    # --- GRAPH System
    set title "${FILE}"
    set xlabel "Voltage [V]"
    set ylabel "Occupation"
    plot "${FILE}" using 1:2 with lines linestyle 1 title "Population p1", "${FILE}" using 1:3 with lines linestyle 2 title "Population p2", "${FILE}" using 1:4 with lines linestyle 3 title "Population p3", "${FILE}" using 1:5 with lines linestyle 4 title "Population p4", "${FILE}" using 1:6 with lines linestyle 5 title "Population p5", "${FILE}" using 1:7 with lines linestyle 6 title "Population p6", "${FILE}" using 1:8 with lines linestyle 7 title "Population p7", "${FILE}" using 1:9 with lines linestyle 8 title "Population p8", "${FILE}" using 1:10 with lines linestyle 9 title "Population p9", "${FILE}" using 1:11 with lines linestyle 10 title "Population p10", , "${FILE}" using 1:11 with lines linestyle 10 title "Population p10", "${FILE}" using 1:11 with lines linestyle 10 title "Population p10", "${FILE}" using 1:12 with lines linestyle 11 title "Population p11", "${FILE}" using 1:13 with lines linestyle 12 title "Population p12", "${FILE}" using 1:14 with lines linestyle 13 title "Population p13", "${FILE}" using 1:15 with lines linestyle 14 title "Population p14", "${FILE}" using 1:16 with lines linestyle 15 title "Population p15"

#PDF OUTPUT
#----------------------------------------------------    
#    set term pdfcairo font "Arial,6"
#   set term pdfcairo font "Arial,10"
#   set output "./png/${FILE}.pdf" 
       
    replot 

EOF
done
