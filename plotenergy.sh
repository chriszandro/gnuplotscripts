#bash/bin

mkdir -p ./observables/energy/png
mkdir -p ./observables/energy/pdf

for FILE in *.dat; do

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

#PNG OUTPUT
#------------------------------------------
#  set term png medium font arial 10
  set term pngcairo font "Arial, 10"
  set output "./observables/energy/png/${FILE}.png" 

  set title "System ${FILE}"
  
    # --- GRAPH System
    set title "${FILE}"
    set xlabel "Voltage [V]"
    set ylabel "Energy [eV]"
    plot "${FILE}" using 1:4 with lines linestyle 4 title "Energy" 

#PDF OUTPUT
#----------------------------------------------------    
#    set term pdfcairo font "Arial,6"
    set term pdfcairo font "Arial,10"
    set output "./observables/energy/pdf/${FILE}.pdf" 
       
    replot 

EOF
done
