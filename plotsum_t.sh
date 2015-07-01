#bash/bin

for FILE in *.evo; do
mkdir -p ./png
mkdir -p ./pdf
echo "Processing $FILE for IV Characteristics"
gnuplot <<- EOF

set style line 80 lt rgb "#000000"

#Grid	
  set style line 81 lt 0  # dashed
  set style line 81 lt rgb "#808080"  # grey
  set grid back linestyle 81
  set border 3 back linestyle 80
  
  set format x "%.2g"
  set xtics nomirror
  set ytics nomirror

#Legend
  
  set key bottom right
  set key off

  set style line 1 lt rgb "#A00000" lw 2 pt 1
  set style line 2 lt rgb "#00A000" lw 2 pt 6
  set style line 3 lt rgb "#5060D0" lw 2 pt 2
  set style line 4 lt rgb "#F25900" lw 2 pt 9
  set style line 5 lt rgb "#F25900" lw 1 pt 4

  set logscale x

#PNG OUTPUT
#------------------------------------------
#  set term png medium font arial 8
  set term pngcairo font "Arial, 10"
  set output "./png/evo_${FILE}.png" 
  set size 2,2 

  set multiplot layout 2,2 rowsfirst title "${FILE}" 

    # --- GRAPH Current
    set title "Current"
    set xlabel "time [a.u.]"
    set ylabel "Current [muA ]"
    plot "${FILE}" using 1:3 with lines linestyle 2 

    # --- GRAPH Position
    set title "Position"
    set xlabel "time [a.u.]"
    set ylabel "Position [Bohr Radius]"
    plot "${FILE}" using 1:2 with lines linestyle 3

    # --- GRAPH 3
    set title "Energy"
    set xlabel "time [a.u.]"
    set ylabel "Energy [eV]"
    plot "${FILE}" using 1:4 with lines linestyle 4

    # --- GRAPH d
    set title "Occupation"
    set xlabel "time [a.u.]"
    set ylabel "n"
    plot "${FILE}" using 1:6 with lines linestyle 5

unset multiplot

#PDF OUTPUT
#----------------------------------------------------    
#    set term pdf font "Arial,4"
    set term pdfcairo font "Arial,10"
    set output "./pdf/evo_${FILE}.pdf" 
    set size 11,8.5
     
  set multiplot layout 2,2 rowsfirst title "${FILE}"

    # --- GRAPH Current
    set title "Current"
    set xlabel "time [a.u.]"
    set ylabel "Current [muA ]"
    plot "${FILE}" using 1:3 with lines linestyle 2

    # --- GRAPH Position
    set title "Position"
    set xlabel "time [a.u.]"
    set ylabel "Position [Bohr Radius]"
    plot "${FILE}" using 1:2 with lines linestyle 3

    # --- GRAPH 3
    set title "Energy"
    set xlabel "time [a.u.]"
    set ylabel "Energy [eV]"
    plot "${FILE}" using 1:4 with lines linestyle 4

    # --- GRAPH d
    set title "Occupation"
    set xlabel "time [a.u.]"
    set ylabel "n"
    plot "${FILE}" using 1:6 with lines linestyle 5

unset multiplot


EOF
done
